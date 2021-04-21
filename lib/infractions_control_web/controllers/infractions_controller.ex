defmodule InfractionsControlWeb.InfractionsController do
  use InfractionsControlWeb, :controller

  alias InfractionsControl.Infraction
  alias InfractionsControlWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Infraction{} = infraction} <- InfractionsControl.create_infraction(params) do
      conn
      |> put_status(:created)
      |> render("create.json", infraction: infraction)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Infraction{} = _infraction} <- InfractionsControl.delete_infraction(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def index(conn, _params) do
    with {:ok, infractions} <- InfractionsControl.index_infractions() do
      conn
      |> put_status(:ok)
      |> render("index.json", infractions: infractions)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Infraction{} = infraction} <- InfractionsControl.show_infraction(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", infraction: infraction)
    end
  end

  def update(conn, %{"id" => _id} = params) do
    with {:ok, %Infraction{} = infraction} <- InfractionsControl.update_infraction(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", infraction: infraction)
    end
  end
end
