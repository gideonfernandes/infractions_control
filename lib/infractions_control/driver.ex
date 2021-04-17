defmodule InfractionsControl.Driver do
  @moduledoc """
  This module represents the drivers table schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias InfractionsControl.City

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_attrs [:cpf, :license_number, :license_expiration_date, :name]
  @non_required_attrs [:age, :email, :phone_number]
  @derive {Jason.Encoder, only: [:id] ++ @required_attrs ++ @non_required_attrs}

  schema "drivers" do
    field :age, :integer
    field :cpf, :string
    field :email, :string
    field :license_expiration_date, :date
    field :license_number, :string
    field :name, :string
    field :phone_number, :string

    belongs_to :city, City

    timestamps()
  end

  def changeset(driver \\ %__MODULE__{}, attrs) do
    driver
    |> cast(attrs, @required_attrs ++ @non_required_attrs)
    |> validate_required(@required_attrs)
    |> validate_length(:cpf, is: 11)
    |> validate_length(:license_number, is: 11)
    |> validate_format(:email, ~r/@/)
    |> validate_number(:age, greater_than: 17, less_than_or_equal_to: 60)
    |> unique_constraint([:cpf, :license_number])
  end
end
