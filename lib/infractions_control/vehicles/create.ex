defmodule InfractionsControl.Vehicles.Create do
  @moduledoc """
  This module is responsible for creates a new vehicle
  """

  alias InfractionsControl.{Error, Repo, Vehicle}

  def call(params) do
    params
    |> Vehicle.changeset()
    |> Repo.insert()
    |> handle_insert_response()
  end

  def handle_insert_response({:ok, %Vehicle{} = vehicle}), do: {:ok, vehicle}

  def handle_insert_response({:error, changeset}) do
    {:error, %Error{status: :bad_request, result: changeset}}
  end
end
