defmodule InfractionsControl.Repo.Migrations.CreateDriversTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :age, :integer
      add :cpf, :string, null: false
      add :license_number, :string, null: false
      add :license_expiration_date, :date, null: false
      add :name, :string, null: false
      add :email, :string
      add :phone_number, :string

      add :city_id, references(:cities, type: :binary_id, on_delete: :nothing)

      timestamps()
    end

    create index(:drivers, [:city_id])
    create unique_index(:drivers, [:cpf, :license_number])
    create unique_index(:drivers, [:email])
  end
end
