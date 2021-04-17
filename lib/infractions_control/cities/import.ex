defmodule InfractionsControl.Cities.Import do
  @moduledoc """
  This module imports all cities from csv fixture file
  """

  def call(filepath \\ "priv/repo/seeds/fixtures/cities.csv") do
    filepath
    |> File.stream!()
    |> CSV.decode(headers: true, separator: ?;, strip_fields: true)
    |> Enum.to_list()
    |> Enum.each(fn {:ok, city} -> city end)
  end
end
