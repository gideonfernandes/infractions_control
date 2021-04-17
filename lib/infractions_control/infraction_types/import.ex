defmodule InfractionsControl.InfractionTypes.Import do
  @moduledoc """
  This module imports all infraction types from csv fixture file
  """

  def call(filepath \\ "priv/repo/seeds/fixtures/infraction_types.csv") do
    filepath
    |> File.stream!()
    |> CSV.decode(headers: true, strip_fields: true)
    |> Enum.to_list()
    |> Enum.each(fn {:ok, infraction_type} -> infraction_type end)
  end
end
