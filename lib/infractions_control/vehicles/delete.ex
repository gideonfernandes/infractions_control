defmodule InfractionsControl.Vehicles.Delete do
  @moduledoc """
  This module is responsible for deletes an specific vehicle
  """

  alias InfractionsControl.{Error, Repo, Vehicle}

  def call(id) do
    with %Vehicle{} = vehicle <- Repo.get(Vehicle, id),
         {:ok, deleted_vehicle} <- Repo.delete(vehicle) do
      {:ok, deleted_vehicle}
    else
      nil -> {:error, Error.build_vehicle_not_found()}
      {:error, changeset} -> {:error, %Error{status: :bad_request, result: changeset}}
    end
  end
end
