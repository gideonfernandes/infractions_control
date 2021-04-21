defmodule InfractionsControl.Infractions.Show do
  @moduledoc """
  This module is responsible for shows an specific infraction
  """

  alias InfractionsControl.{Error, Infraction, Repo}

  def call(id) do
    case Repo.get(Infraction, id) do
      %Infraction{} = infraction -> {:ok, Repo.preload(infraction, [:city, :infraction_type])}
      nil -> {:error, Error.build_infraction_not_found()}
    end
  end
end
