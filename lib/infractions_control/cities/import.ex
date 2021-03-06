defmodule InfractionsControl.Cities.Import do
  @moduledoc """
  This module imports all cities from csv fixture file
  """

  alias InfractionsControl.{City, Repo, State}

  def call(filenames \\ ["part_1.csv", "part_2.csv", "part_3.csv"]) do
    filenames
    |> Task.async_stream(&import_file/1, timeout: 20_000)
    |> Stream.run()
  end

  defp import_file(filename) do
    "priv/repo/seeds/fixtures/cities/#{filename}"
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
