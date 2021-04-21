defmodule InfractionsControl.Infractions.Index do
  @moduledoc """
  This module is responsible for shows all infractions
  """

  alias InfractionsControl.{Infraction, Repo}

  def call do
    case Repo.all(Infraction) do
      [%Infraction{} | _tail] = infractions ->
        {:ok, Repo.preload(infractions, [:city, :infraction_type])}

      [] ->
        {:ok, []}
    end
  end
end
