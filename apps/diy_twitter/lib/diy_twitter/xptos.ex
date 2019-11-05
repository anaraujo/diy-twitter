defmodule DiyTwitter.XPTOS do
  @moduledoc """
  The XPTOS context.
  """

  import Ecto.Query, warn: false
  alias DiyTwitter.Repo

  alias DiyTwitter.XPTOS.Pudim

  @doc """
  Returns the list of pudins.

  ## Examples

      iex> list_pudins()
      [%Pudim{}, ...]

  """
  def list_pudins do
    Repo.all(Pudim)
  end

  @doc """
  Gets a single pudim.

  Raises `Ecto.NoResultsError` if the Pudim does not exist.

  ## Examples

      iex> get_pudim!(123)
      %Pudim{}

      iex> get_pudim!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pudim!(id), do: Repo.get!(Pudim, id)

  @doc """
  Creates a pudim.

  ## Examples

      iex> create_pudim(%{field: value})
      {:ok, %Pudim{}}

      iex> create_pudim(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pudim(attrs \\ %{}) do
    %Pudim{}
    |> Pudim.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pudim.

  ## Examples

      iex> update_pudim(pudim, %{field: new_value})
      {:ok, %Pudim{}}

      iex> update_pudim(pudim, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pudim(%Pudim{} = pudim, attrs) do
    pudim
    |> Pudim.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pudim.

  ## Examples

      iex> delete_pudim(pudim)
      {:ok, %Pudim{}}

      iex> delete_pudim(pudim)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pudim(%Pudim{} = pudim) do
    Repo.delete(pudim)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pudim changes.

  ## Examples

      iex> change_pudim(pudim)
      %Ecto.Changeset{source: %Pudim{}}

  """
  def change_pudim(%Pudim{} = pudim) do
    Pudim.changeset(pudim, %{})
  end
end
