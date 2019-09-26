defmodule DiyTwitterWeb.PageController do
  use DiyTwitterWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
