defmodule InfractionsControl.State do
  @moduledoc """
  This module represents the states table schema
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias InfractionsControl.{City, Country, Repo}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_attrs [:state_code, :name, :ibge_code]
  @derive {Jason.Encoder, only: [:id] ++ @required_attrs}

  schema "states" do
    field :ibge_code, :string
    field :name, :string
    field :state_code, :string

    belongs_to :country, Country
    has_many :cities, City, on_delete: :delete_all

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> validate_length(:state_code, is: 2)
    |> unique_constraint([:ibge_code])
    |> unique_constraint([:name, :state_code])
    |> put_assoc(:country, Repo.get_by(Country, international_name: "Brazil"))
  end
end
