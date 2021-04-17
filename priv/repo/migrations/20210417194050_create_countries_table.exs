defmodule InfractionsControl.Repo.Migrations.CreateCountriesTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:countries) do
      add :bacen_code, :string, null: false
      add :name, :string, null: false
      add :international_name, :string
      add :iso3166_alpha2_code, :string
      add :iso3166_alpha3_code, :string
      add :iso3166_numeric_code, :string

      timestamps()
    end

    create unique_index(:countries, [:bacen_code, :name])
  end
end
