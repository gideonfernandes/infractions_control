defmodule InfractionsControl.FinancialBanks.Import do
  @moduledoc """
  This module imports all financial banks from csv fixture file
  """

  alias InfractionsControl.{FinancialBank, Repo}

  def call(filepath \\ "priv/repo/seeds/fixtures/countries.csv") do
    filepath
    |> File.stream!()
    |> CSV.decode(headers: true, strip_fields: true)
    |> Enum.to_list()
    |> Enum.each(fn {:ok, financial_bank} -> insert_imported(financial_bank) end)
  end

  defp insert_imported(financial_bank) do
    FinancialBank.changeset(financial_bank)
    |> Repo.insert!()
  end
end
