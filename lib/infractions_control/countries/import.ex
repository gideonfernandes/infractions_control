defmodule InfractionsControl.Countries.Import do
  @moduledoc """
  This module imports all countries from csv fixture file
  """

  alias InfractionsControl.{Country, Repo}

  def call(filepath \\ "priv/repo/seeds/fixtures/countries.csv") do
    filepath
    |> File.stream!()
    |> CSV.decode(headers: true, strip_fields: true)
    |> Enum.to_list()
    |> Enum.each(fn {:ok, country} -> insert_imported(country) end)
  end

  defp insert_imported(country) do
    Country.changeset(country)
    |> Repo.insert!()
  end
end
