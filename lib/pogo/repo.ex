defmodule Pogo.Repo do
  use Ecto.Repo,
    otp_app: :pogo,
    adapter: Ecto.Adapters.Postgres
end
