defmodule InfractionsControlWeb.VehiclesController do
  use InfractionsControlWeb, :controller

  alias InfractionsControl.Vehicle
  alias InfractionsControlWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Vehicle{} = vehicle} <- InfractionsControl.create_vehicle(params) do
      conn
      |> put_status(:created)
      |> render("create.json", vehicle: vehicle)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Vehicle{} = _vehicle} <- InfractionsControl.delete_vehicle(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def index(conn, _params) do
    with {:ok, vehicles} <- InfractionsControl.index_vehicles() do
      conn
      |> put_status(:ok)
      |> render("index.json", vehicles: vehicles)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Vehicle{} = vehicle} <- InfractionsControl.show_vehicle(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", vehicle: vehicle)
    end
  end

  def update(conn, %{"id" => _id} = params) do
    with {:ok, %Vehicle{} = vehicle} <- InfractionsControl.update_vehicle(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", vehicle: vehicle)
    end
  end
end
