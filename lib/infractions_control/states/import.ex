defmodule InfractionsControl.States.Import do
  @moduledoc """
  This module imports all states from csv fixture file
  """

  alias InfractionsControl.{Repo, State}

  def call(filepath \\ "priv/repo/seeds/fixtures/states.csv") do
    filepath
    |> File.stream!()
    |> CSV.decode(headers: true, strip_fields: true)
    |> Enum.to_list()
    |> Enum.each(fn {:ok, state} -> insert_imported(state) end)
  end

  defp insert_imported(state) do
    state
    |> State.changeset()
    |> Repo.insert!()
  end
end
