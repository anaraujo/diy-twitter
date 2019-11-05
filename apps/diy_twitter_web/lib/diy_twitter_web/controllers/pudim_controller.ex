defmodule DiyTwitterWeb.PudimController do
  use DiyTwitterWeb, :controller

  alias DiyTwitter.XPTOS
  alias DiyTwitter.XPTOS.Pudim

  def index(conn, _params) do
    pudins = XPTOS.list_pudins()
    render(conn, "index.html", pudins: pudins)
  end

  def new(conn, _params) do
    changeset = XPTOS.change_pudim(%Pudim{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pudim" => pudim_params}) do
    case XPTOS.create_pudim(pudim_params) do
      {:ok, pudim} ->
        conn
        |> put_flash(:info, "Pudim created successfully.")
        |> redirect(to: Routes.pudim_path(conn, :show, pudim))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pudim = XPTOS.get_pudim!(id)
    render(conn, "show.html", pudim: pudim)
  end

  def edit(conn, %{"id" => id}) do
    pudim = XPTOS.get_pudim!(id)
    changeset = XPTOS.change_pudim(pudim)
    render(conn, "edit.html", pudim: pudim, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pudim" => pudim_params}) do
    pudim = XPTOS.get_pudim!(id)

    case XPTOS.update_pudim(pudim, pudim_params) do
      {:ok, pudim} ->
        conn
        |> put_flash(:info, "Pudim updated successfully.")
        |> redirect(to: Routes.pudim_path(conn, :show, pudim))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pudim: pudim, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pudim = XPTOS.get_pudim!(id)
    {:ok, _pudim} = XPTOS.delete_pudim(pudim)

    conn
    |> put_flash(:info, "Pudim deleted successfully.")
    |> redirect(to: Routes.pudim_path(conn, :index))
  end
end
