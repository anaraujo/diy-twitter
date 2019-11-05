defmodule DiyTwitterWeb.PudimControllerTest do
  use DiyTwitterWeb.ConnCase

  alias DiyTwitter.XPTOS

  @create_attrs %{sabor: "some sabor"}
  @update_attrs %{sabor: "some updated sabor"}
  @invalid_attrs %{sabor: nil}

  def fixture(:pudim) do
    {:ok, pudim} = XPTOS.create_pudim(@create_attrs)
    pudim
  end

  describe "index" do
    test "lists all pudins", %{conn: conn} do
      conn = get(conn, Routes.pudim_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Pudins"
    end
  end

  describe "new pudim" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.pudim_path(conn, :new))
      assert html_response(conn, 200) =~ "New Pudim"
    end
  end

  describe "create pudim" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pudim_path(conn, :create), pudim: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.pudim_path(conn, :show, id)

      conn = get(conn, Routes.pudim_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Pudim"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pudim_path(conn, :create), pudim: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pudim"
    end
  end

  describe "edit pudim" do
    setup [:create_pudim]

    test "renders form for editing chosen pudim", %{conn: conn, pudim: pudim} do
      conn = get(conn, Routes.pudim_path(conn, :edit, pudim))
      assert html_response(conn, 200) =~ "Edit Pudim"
    end
  end

  describe "update pudim" do
    setup [:create_pudim]

    test "redirects when data is valid", %{conn: conn, pudim: pudim} do
      conn = put(conn, Routes.pudim_path(conn, :update, pudim), pudim: @update_attrs)
      assert redirected_to(conn) == Routes.pudim_path(conn, :show, pudim)

      conn = get(conn, Routes.pudim_path(conn, :show, pudim))
      assert html_response(conn, 200) =~ "some updated sabor"
    end

    test "renders errors when data is invalid", %{conn: conn, pudim: pudim} do
      conn = put(conn, Routes.pudim_path(conn, :update, pudim), pudim: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pudim"
    end
  end

  describe "delete pudim" do
    setup [:create_pudim]

    test "deletes chosen pudim", %{conn: conn, pudim: pudim} do
      conn = delete(conn, Routes.pudim_path(conn, :delete, pudim))
      assert redirected_to(conn) == Routes.pudim_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.pudim_path(conn, :show, pudim))
      end
    end
  end

  defp create_pudim(_) do
    pudim = fixture(:pudim)
    {:ok, pudim: pudim}
  end
end
