defmodule DiyTwitter.Accounts.Users do
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
    field :username, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name, :username, :phone, :email, :password_hash, :bio, :location, :website, :birth_date])
    |> validate_required([:name, :username, :phone, :email, :password_hash, :birth_date])
  end
end
