defmodule InfractionsControl.Repo.Migrations.CreateVehiclesTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:vehicles) do
      add :code, :string, null: false
      add :color, :string
      add :fabrication_year, :integer, null: false
      add :model, :string
      add :renavam, :string, null: false
      add :price, :decimal, null: false

      timestamps()
    end

    create unique_index(:vehicles, [:code])
    create constraint(:vehicles, :price_must_be_positive, check: "price > 0")
  end
end
