defmodule InfractionsControl.FinancialBanks.Import do
  @moduledoc """
  This module imports all financial banks from csv fixture file
  """

  def call(filepath \\ "priv/repo/seeds/fixtures/countries.csv") do
    filepath
    |> File.stream!()
    |> CSV.decode(headers: true, strip_fields: true)
    |> Enum.to_list()
    |> Enum.each(fn {:ok, financial_bank} -> financial_bank end)
  end
end
