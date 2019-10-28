defmodule NotTwitter.Repo do
  use Ecto.Repo,
    otp_app: :not_twitter,
    adapter: Ecto.Adapters.Postgres
end
