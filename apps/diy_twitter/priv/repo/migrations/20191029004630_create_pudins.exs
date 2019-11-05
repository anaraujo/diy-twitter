defmodule DiyTwitter.Repo.Migrations.CreatePudins do
  use Ecto.Migration

  def change do
    create table(:pudins) do
      add :sabor, :string

      timestamps()
    end

  end
end
