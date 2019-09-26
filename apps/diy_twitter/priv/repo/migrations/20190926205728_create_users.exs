defmodule DiyTwitter.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :phone, :string
      add :email, :string
      add :password_hash, :string
      add :bio, :string
      add :location, :string
      add :website, :string
      add :birth_date, :date

      timestamps()
    end

  end
end
