defmodule InfractionsControl.Vehicles.Index do
  @moduledoc """
  This module is responsible for shows all vehicles
  """

  alias InfractionsControl.{Repo, Vehicle}

  def call do
    case Repo.all(Vehicle) do
      [%Vehicle{} | _tail] = infractions -> {:ok, infractions}
      [] -> {:ok, []}
    end
  end
end
