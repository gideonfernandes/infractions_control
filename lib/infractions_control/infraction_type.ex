defmodule InfractionsControl.InfractionType do
  @moduledoc """
  This module represents the infraction_types table schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias InfractionsControl.Infraction

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_attrs [:code, :ctb, :description, :article_or_gravity_points, :responsable]
  @derive {Jason.Encoder, only: [:id] ++ @required_attrs}

  schema "infraction_types" do
    field :article, :string
    field :code, :string
    field :ctb, :string
    field :description, :string
    field :article_or_gravity_points, :string
    field :responsable, :string

    has_many :infractions, Infraction, on_delete: :delete_all

    timestamps()
  end

  def changeset(infraction_type \\ %__MODULE__{}, attrs) do
    infraction_type
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint(:code)
  end
end
