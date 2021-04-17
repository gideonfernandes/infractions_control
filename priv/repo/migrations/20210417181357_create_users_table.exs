defmodule InfractionsControl.Repo.Migrations.CreateUsersTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:users) do
      add :address, :string, null: false
      add :age, :integer
      add :cep, :string, null: false
      add :cpf, :string, null: false
      add :email, :string, null: false
      add :name, :string, null: false
      add :password_hash, :string, null: false

      timestamps()
    end

    create unique_index(:users, [:cpf])
    create unique_index(:users, [:email])
  end
end
