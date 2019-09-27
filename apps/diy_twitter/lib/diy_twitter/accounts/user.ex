defmodule DiyTwitter.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :bio, :string
    field :birth_date, :date
    field :email, :string
    field :location, :string
    field :name, :string
    field :password_hash, :string
    field :phone, :string
    field :profile_avatar, :string
    field :username, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email, :password_hash, :phone, :bio, :location, :website, :birth_date, :profile_avatar])
    |> validate_required([:name, :username, :email, :password_hash, :phone, :birth_date])
  end
end
