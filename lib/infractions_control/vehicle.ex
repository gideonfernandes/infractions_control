defmodule InfractionsControl.Vehicle do
  @moduledoc """
  This module represents the vehicles table schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_attrs [:code, :fabrication_year, :renavam, :price]
  @non_required_attrs [:color, :model]
  @derive {Jason.Encoder, only: [:id] ++ @required_attrs ++ @non_required_attrs}

  schema "vehicles" do
    field :code, :string
    field :color, :string
    field :fabrication_year, :integer
    field :model, :string
    field :renavam, :string
    field :price, :decimal

    timestamps()
  end

  def changeset(vehicle \\ %__MODULE__{}, attrs) do
    vehicle
    |> cast(attrs, @required_attrs ++ @non_required_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint([:code])
    |> validate_inclusion(:price, 1..5_000_000)
  end
end
