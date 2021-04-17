defmodule InfractionsControl.Repo.Migrations.CreateCitiesTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:cities) do
      add :capital, :string
      add :category_number, :string
      add :ibge_code, :string
      add :label_name, :string
      add :latitude, :string
      add :longitude, :string
      add :name, :string, null: false

      add :state_id, references(:states, type: :binary_id, on_delete: :delete_all)

      timestamps()
    end

    create index(:cities, [:state_id])
    create unique_index(:cities, [:ibge_code, :name])
  end
end
