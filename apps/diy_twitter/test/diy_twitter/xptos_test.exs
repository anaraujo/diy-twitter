defmodule DiyTwitter.XPTOSTest do
  use DiyTwitter.DataCase

  alias DiyTwitter.XPTOS

  describe "pudins" do
    alias DiyTwitter.XPTOS.Pudim

    @valid_attrs %{sabor: "some sabor"}
    @update_attrs %{sabor: "some updated sabor"}
    @invalid_attrs %{sabor: nil}

    def pudim_fixture(attrs \\ %{}) do
      {:ok, pudim} =
        attrs
        |> Enum.into(@valid_attrs)
        |> XPTOS.create_pudim()

      pudim
    end

    test "list_pudins/0 returns all pudins" do
      pudim = pudim_fixture()
      assert XPTOS.list_pudins() == [pudim]
    end

    test "get_pudim!/1 returns the pudim with given id" do
      pudim = pudim_fixture()
      assert XPTOS.get_pudim!(pudim.id) == pudim
    end

    test "create_pudim/1 with valid data creates a pudim" do
      assert {:ok, %Pudim{} = pudim} = XPTOS.create_pudim(@valid_attrs)
      assert pudim.sabor == "some sabor"
    end

    test "create_pudim/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = XPTOS.create_pudim(@invalid_attrs)
    end

    test "update_pudim/2 with valid data updates the pudim" do
      pudim = pudim_fixture()
      assert {:ok, %Pudim{} = pudim} = XPTOS.update_pudim(pudim, @update_attrs)
      assert pudim.sabor == "some updated sabor"
    end

    test "update_pudim/2 with invalid data returns error changeset" do
      pudim = pudim_fixture()
      assert {:error, %Ecto.Changeset{}} = XPTOS.update_pudim(pudim, @invalid_attrs)
      assert pudim == XPTOS.get_pudim!(pudim.id)
    end

    test "delete_pudim/1 deletes the pudim" do
      pudim = pudim_fixture()
      assert {:ok, %Pudim{}} = XPTOS.delete_pudim(pudim)
      assert_raise Ecto.NoResultsError, fn -> XPTOS.get_pudim!(pudim.id) end
    end

    test "change_pudim/1 returns a pudim changeset" do
      pudim = pudim_fixture()
      assert %Ecto.Changeset{} = XPTOS.change_pudim(pudim)
    end
  end
end
