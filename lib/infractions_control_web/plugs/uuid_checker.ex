defmodule InfractionsControlWeb.Plugs.UUIDChecker do
  @moduledoc """
  This module is responsible for checking all ids coming from conn params, blocking when there is an invalid
  """

  import Plug.Conn

  alias Ecto.UUID
  alias Plug.Conn

  @uuid_types [
    "id",
    "account_id",
    "city_id",
    "county_id",
    "driver_id",
    "infraction_type_id",
    "state_id",
    "vehicle_id"
  ]

  def init(options), do: options

  def call(%Conn{params: params} = conn, _options) do
    Enum.each(@uuid_types, fn uuid_type ->
      if Map.has_key?(params, uuid_type), do: is_valid_uuid?({conn, params, uuid_type})
    end)
  end

  def call(conn, _options), do: conn

  defp is_valid_uuid?({conn, params, type}) do
    id = Map.get(params, type)

    case UUID.cast(id) do
      {:ok, _uuid} -> conn
      :error -> handle_error_resp(conn, type)
    end
  end

  defp handle_error_resp(conn, type) when type === "id" do
    render_error(conn, "Invalid UUID format!")
  end

  defp handle_error_resp(conn, type), do: render_error(conn, "Invalid #{type} format!")

  defp render_error(conn, message) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, Jason.encode!(%{message: message}))
    |> halt()
  end
end
