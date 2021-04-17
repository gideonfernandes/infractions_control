defmodule InfractionsControl.FinancialBank do
  @moduledoc """
  This module represents the financial_banks table schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_attrs [:bacen_code, :name]
  @non_required_attrs [
    :international_name,
    :iso3166_alpha2_code,
    :iso3166_alpha3_code,
    :iso3166_numeric_code
  ]
  @derive {Jason.Encoder, only: [:id] ++ @required_attrs ++ @non_required_attrs}

  schema "financial_banks" do
    field :bacen_code, :string
    field :international_name, :string
    field :iso3166_alpha2_code, :string
    field :iso3166_alpha3_code, :string
    field :iso3166_numeric_code, :string
    field :name, :string

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_attrs ++ @non_required_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint([:bacen_code, :name])
  end
end
