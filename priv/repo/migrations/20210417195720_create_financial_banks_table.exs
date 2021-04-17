defmodule InfractionsControl.Repo.Migrations.CreateFinancialBanksTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:financial_banks) do
      add :bacen_code, :string, null: false
      add :international_name, :string
      add :name, :string, null: false
      add :iso3166_alpha2_code, :string
      add :iso3166_alpha3_code, :string
      add :iso3166_numeric_code, :string

      timestamps()
    end

    create unique_index(:financial_banks, [:bacen_code, :name])
  end
end
