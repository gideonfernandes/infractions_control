defmodule InfractionsControl.Repo.Migrations.CreateInfractionsTable do
  @moduledoc false

  use Ecto.Migration

  def change do
    create table(:infractions) do
      add :notification_number, :string, null: false
      add :post_date, :date, null: false
      add :comments, :string
      add :description, :string
      add :location, :string
      add :infraction_at, :naive_datetime, null: false
      add :ait_number, :string
      add :agent_number, :string
      add :dispute_date, :date
      add :dispute_comments, :string
      add :dispute_result, :dispute_result
      add :dispute_result_date, :naive_datetime
      add :dispute_result_comments, :string
      add :ticket_value, :decimal, null: false, default: 0
      add :ticket_due_date, :date
      add :ticket_value_with_discount, :decimal, null: false, default: 0
      add :status, :infraction_status, null: false, default: "pending"

      add :city_id, references(:cities, type: :binary_id, on_delete: :nothing), null: false
      add :vehicle_id, references(:vehicles, type: :binary_id, on_delete: :nothing), null: false
      add :driver_id, references(:drivers, type: :binary_id, on_delete: :nothing)

      add :infraction_type_id,
          references(:infraction_types, type: :binary_id, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:infractions, [:notification_number])
    create index(:infractions, [:city_id])
    create index(:infractions, [:vehicle_id])
    create index(:infractions, [:driver_id])
    create index(:infractions, [:infraction_type_id])

    create constraint(:infractions, :ticket_value_must_be_grater_than_or_equal_to_zero,
             check: "ticket_value >= 0"
           )

    create constraint(
             :infractions,
             :ticket_value_with_discount_must_be_grater_than_or_equal_to_zero,
             check: "ticket_value_with_discount >= 0"
           )
  end
end
