defmodule DiyTwitter.XPTOS.Pudim do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pudins" do
    field :sabor, :string

    timestamps()
  end

  @doc false
  def changeset(pudim, attrs) do
    pudim
    |> cast(attrs, [:sabor])
    |> validate_required([:sabor])
  end
end
