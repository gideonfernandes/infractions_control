defmodule InfractionsControl.Cities.Import do
  @moduledoc """
  This module imports all cities from csv fixture file
  """

  alias InfractionsControl.{City, Repo, State}

  def call(filepath \\ "priv/repo/seeds/fixtures/cities.csv") do
    filepath
    |> File.stream!()
    |> CSV.decode(headers: true, strip_fields: true)
    |> Enum.to_list()
    |> Enum.each(fn {:ok, city} -> insert_imported(city) end)
  end

  defp insert_imported(%{"state" => city_state} = city) do
    case Repo.get_by(State, state_code: city_state) do
      %InfractionsControl.State{} = state -> do_update_with_state_assoc(city, state)
      nil -> do_update(city)
    end
  end

  defp do_update(city) do
    city
    |> City.changeset()
    |> Repo.insert!()
  end

  defp do_update_with_state_assoc(city, state) do
    city
    |> City.changeset(state)
    |> Repo.insert!()
  end
end
