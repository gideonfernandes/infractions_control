defmodule InfractionsControl.Repo.Migrations.CreateStatesTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:states) do
      add :ibge_code, :string, null: false
      add :name, :string, null: false
      add :state_code, :string, null: false

      add :country_id, references(:countries, type: :binary_id, on_delete: :delete_all)

      timestamps()
    end

    create index(:states, [:country_id])
    create unique_index(:states, [:ibge_code])
    create unique_index(:states, [:name, :state_code])
  end
end
