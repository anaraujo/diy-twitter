defmodule DiyTwitter.Repo do
  use Ecto.Repo,
    otp_app: :diy_twitter,
    adapter: Ecto.Adapters.Postgres
end
