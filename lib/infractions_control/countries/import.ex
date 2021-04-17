defmodule InfractionsControl.Countries.Import do
  @moduledoc """
  This module imports all countries from csv fixture file
  """

  def call(filepath \\ "priv/repo/seeds/fixtures/countries.csv") do
    filepath
    |> File.stream!()
    |> CSV.decode(headers: true, strip_fields: true)
    |> Enum.to_list()
    |> Enum.each(fn {:ok, country} -> country end)

    # |> Enum.each(fn {:ok, country} -> Repo.insert!(%InfractionsControl.Country{}, country) end)
  end
end
