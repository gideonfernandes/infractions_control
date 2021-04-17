defmodule InfractionsControl.City do
  @moduledoc """
  This module represents the cities table schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias InfractionsControl.{Driver, Infraction, State}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @non_required_attrs [:capital, :category_number, :label_name, :latitude, :longitude, :ibge_code]
  @derive {Jason.Encoder, only: [:id, :name] ++ @non_required_attrs}

  schema "cities" do
    field :capital, :string
    field :category_number, :string
    field :ibge_code, :string
    field :label_name, :string
    field :latitude, :string
    field :longitude, :string
    field :name, :string

    belongs_to :state, State
    has_many :drivers, Driver, on_delete: :nothing
    has_many :infractions, Infraction, on_delete: :nothing

    timestamps()
  end

  def changeset(attrs) do
    handle_changeset(attrs)
  end

  def changeset(attrs, state) do
    handle_changeset(attrs)
    |> put_assoc(:state, state)
  end

  defp handle_changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:name] ++ @non_required_attrs)
    |> validate_required([:name])
    |> unique_constraint([:ibge_code, :name])
  end
end
