defmodule InfractionsControl.Repo do
  use Ecto.Repo,
    otp_app: :infractions_control,
    adapter: Ecto.Adapters.Postgres
end
