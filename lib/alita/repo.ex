defmodule Alita.Repo do
  use Ecto.Repo,
    otp_app: :alita,
    adapter: Ecto.Adapters.Postgres
end
