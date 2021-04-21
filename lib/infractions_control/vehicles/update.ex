defmodule InfractionsControl.Vehicles.Update do
  @moduledoc """
  This module is responsible to updates an vehicle
  """

  alias InfractionsControl.{Error, Repo, Vehicle}

  def call(%{"id" => id} = attrs) do
    with %Vehicle{} = vehicle <- Repo.get(Vehicle, id),
         {:ok, updated_vehicle} <- update_changeset(vehicle, attrs) do
      {:ok, updated_vehicle}
    else
      nil -> {:error, Error.build_vehicle_not_found()}
      {:error, changeset} -> {:error, %Error{status: :bad_request, result: changeset}}
    end
  end

  defp update_changeset(vehicle, attrs) do
    Vehicle.changeset(vehicle, attrs)
    |> Repo.update()
  end
end
