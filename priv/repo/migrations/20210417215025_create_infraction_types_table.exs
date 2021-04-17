defmodule InfractionsControl.Repo.Migrations.CreateInfractionTypesTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:infraction_types) do
      add :article_or_gravity_points, :string, null: false
      add :ctb, :string, null: false
      add :code, :string, null: false
      add :description, :string, null: false
      add :responsable, :string, null: false

      timestamps()
    end

    create unique_index(:infraction_types, [:code])
  end
end
