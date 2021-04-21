defmodule InfractionsControl.Infraction do
  @moduledoc """
  This module represents the infractions table schema
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias InfractionsControl.{City, Driver, InfractionType, Vehicle}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_attrs [
    :notification_number,
    :post_date,
    :infraction_at,
    :ticket_value,
    :ticket_value_with_discount,
    :status,
    :city_id,
    :vehicle_id,
    :infraction_type_id
  ]

  @non_required_attrs [
    :comments,
    :description,
    :location,
    :ait_number,
    :agent_number,
    :dispute_date,
    :dispute_comments,
    :driver_id,
    :dispute_result,
    :dispute_result_date,
    :dispute_result_comments,
    :ticket_due_date
  ]

  @derive {Jason.Encoder, only: [:id, :city, :infraction_type] ++ @required_attrs}
  @dispute_results [:accepted, :rejected]
  @infraction_status [:pending, :reviewing, :finished]

  schema "infractions" do
    field :agent_number, :string
    field :ait_number, :string
    field :comments, :string
    field :description, :string
    field :dispute_comments, :string
    field :dispute_date, :date
    field :dispute_result, Ecto.Enum, values: @dispute_results
    field :dispute_result_comments, :string
    field :dispute_result_date, :naive_datetime
    field :infraction_at, :naive_datetime
    field :location, :string
    field :notification_number, :string
    field :post_date, :date
    field :status, Ecto.Enum, values: @infraction_status
    field :ticket_due_date, :date
    field :ticket_value, :decimal
    field :ticket_value_with_discount, :decimal

    belongs_to :city, City
    belongs_to :driver, Driver
    belongs_to :vehicle, Vehicle
    belongs_to :infraction_type, InfractionType

    timestamps()
  end

  def changeset(infraction \\ %__MODULE__{}, attrs) do
    infraction
    |> cast(attrs, @required_attrs ++ @non_required_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint([:notification_number])
    |> validate_number(:ticket_value, greater_than_or_equal_to: 0)
    |> validate_number(:ticket_value_with_discount, greater_than_or_equal_to: 0)
  end
end
