defmodule InfractionsControl.Vehicles.Show do
  @moduledoc """
  This module is responsible for shows an specific vehicle
  """

  alias InfractionsControl.{Error, Repo, Vehicle}

  def call(id) do
    case Repo.get(Vehicle, id) do
      %Vehicle{} = vehicle -> {:ok, vehicle}
      nil -> {:error, Error.build_vehicle_not_found()}
    end
  end
end
