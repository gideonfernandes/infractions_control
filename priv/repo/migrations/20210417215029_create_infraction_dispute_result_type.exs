defmodule InfractionsControl.Repo.Migrations.CreateInfractionDisputeResultType do
  @moduledoc false

  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE dispute_result AS ENUM ('accepted', 'rejected')"
    down_query = "DROP TYPE dispute_result"

    execute(up_query, down_query)
  end
end
