defmodule InfractionsControl.Repo.Migrations.CreateInfractionStatusType do
  @moduledoc false

  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE infraction_status AS ENUM ('pending', 'reviewing', 'finished')"
    down_query = "DROP TYPE infraction_status"

    execute(up_query, down_query)
  end
end
