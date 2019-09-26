defmodule DiyTwitter.Accounts do
 @moduledoc """
 The Accounts context
 """
 import Ecto.Query, warn: false
 alias DiyTwitter.Repo
 alias DiyTwitter.Accounts.User

  @doc """
  Gets a single user.
  Raises `Ecto.NoResultsError` if the user does not exist.
  ## Examples
      iex> get_user!(123)
      %User{}
      iex> get_user!(456)
      ** (Ecto.NoResultsError)
  """
  def get_user!(id), do Repo.get!(User, id)

  @doc """
  Returns the list of users.
  ## Examples
      iex> list_users()
      [%Company{}, ...]
  """
  def list_users do
    Repo.all(User)
  end

  
  def create_user() do
  end

  def update_user() do
  end

  def delete_user() do
  end

end