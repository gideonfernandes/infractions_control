defmodule InfractionsControl.Country do
  @moduledoc """
  This module represents the countries table schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias InfractionsControl.State

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_attrs [:bacen_code, :name]
  @non_required_attrs [
    :international_name,
    :iso3166_alpha2_code,
    :iso3166_alpha3_code,
    :iso3166_numeric_code
  ]
  @derive {Jason.Encoder, only: [:id] ++ @required_attrs ++ @non_required_attrs}

  schema "countries" do
    field :bacen_code, :string
    field :international_name, :string
    field :iso3166_alpha2_code, :string
    field :iso3166_alpha3_code, :string
    field :iso3166_numeric_code, :string
    field :name, :string

    has_many :states, State, on_delete: :delete_all

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_attrs ++ @non_required_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint([:bacen_code, :name])
  end
end
