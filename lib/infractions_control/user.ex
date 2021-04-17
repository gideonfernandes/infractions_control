defmodule InfractionsControl.User do
  @moduledoc """
  This module represents the users table schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_to_create [:address, :cep, :cpf, :email, :name, :password]
  @required_to_update @required_to_create -- [:password]
  @derive {Jason.Encoder, only: [:id] ++ @required_to_create}

  schema "users" do
    field :address, :string
    field :age, :integer
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_to_create ++ [:age])
    |> validate_required(@required_to_create)
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> handle_changeset()
    |> put_password_hash()
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @required_to_update ++ [:age])
    |> validate_required(@required_to_update)
    |> handle_changeset()
  end

  defp handle_changeset(changeset) do
    changeset
    |> validate_number(:age, greater_than: 17, less_than_or_equal_to: 60)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_length(:uf, is: 2)
    |> unique_constraint([:cpf])
    |> unique_constraint([:email])
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
