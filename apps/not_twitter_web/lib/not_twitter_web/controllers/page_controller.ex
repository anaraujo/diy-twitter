defmodule NotTwitterWeb.PageController do
  use NotTwitterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
