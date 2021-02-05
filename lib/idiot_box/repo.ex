defmodule IdiotBox.Repo do
  use Ecto.Repo,
    otp_app: :idiot_box,
    adapter: Ecto.Adapters.Postgres
end
