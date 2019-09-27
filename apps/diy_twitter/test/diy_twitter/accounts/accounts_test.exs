defmodule DiyTwitter.AccountsTest do
  use DiyTwitter.DataCase
  alias DiyTwitter.Accounts
  alias DiyTwitter.Accounts.User

  @create_user_attrs %{
     bio: "some bio description",
     birth_date: ~D[2000-01-01],
     email: "some@email.com", 
     location: "Curitiba, Brazil", 
     name: "Laura Araujo", 
     password_hash: "fYEWSgRRQdM:APA91bFWrZkV6m3nQSsfxMaVJLIPGJpQ9lbYgg0mwjZadbR4eLL71IUBYtyc7dxcumIDGqwt9ZVIv3HpC3xtAthhfrEii4proLqql3VfMgFmZIfX5kNdnMr6VG-SVS9qc10XIA6FaLKa", 
     phone: "33333-3333", 
     profile_avatar: "someurlimage", 
     username: "@someusername", 
     website: "https://not-twitter.com/" 
  }

  @update_user_attrs %{
    bio: "some updated bio description",
    birth_date: ~D[2000-01-01],
    email: "someupdated@email.com", 
    location: "São Paulo, Brazil", 
    name: "Araujo Lauro", 
    password_hash: "fYEWSgRRQdM:APA91bFWrZkV6m3nQSsfxMaVJLIPGJpQ9lbYgg0mwjZadbR4eLL71IUBYtyc7dxcumIDGqwt9ZVIv3HpC3xtAthhfrEii4proLqql3VfMgFmZIfX5kNdnMr6VG-SVS9qc10XIA6FaLKa", 
    phone: "33333-3333", 
    profile_avatar: "someurlimage", 
    username: "@someusername", 
    website: "https://not-twitter.com/" 
  }

  @invalid_user_attrs %{
    bio: nil,
    birth_date: nil,
    email: nil, 
    location: nil, 
    name: nil, 
    password_hash: nil, 
    phone: nil, 
    profile_avatar: nil, 
    username: nil, 
    website: nil
  }

  def fixture(:user) do
    assert {:ok, user} = Accounts.create_user(@create_user_attrs)
    user
  end

  describe "accounts" do

    test "create_user/1 with valid params" do
      assert {:ok, user} = Accounts.create_user(@create_user_attrs)
      assert user.bio == @create_user_attrs[:bio]
      assert user.name == @create_user_attrs[:name]
      assert user.birth_date == @create_user_attrs[:birth_date]
      assert user.email == @create_user_attrs[:email]
      assert user.phone == @create_user_attrs[:phone]
    end

    test "create_user/1 with invalid params" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_user_attrs)
    end

    test "list_users/0 return user" do
      user = fixture(:user)
      assert Accounts.list_users == [user]
    end

    test "get_user/1 return user" do
      user = fixture(:user)
      assert Accounts.get_user!(user.id) == user
    end

    test "update_user/2 with valid params" do
      user = fixture(:user)
      assert {:ok, user } = Accounts.update_user(user, @update_user_attrs)
      assert user.name == @update_user_attrs[:name]
      assert user.birth_date == @update_user_attrs[:birth_date]
      assert user.email == @update_user_attrs[:email]
      assert user.phone == @update_user_attrs[:phone]
    end

    test "update_user/2 with invalid params" do
      user = fixture(:user)
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_user_attrs)
    end

    test "delete_user/1" do
      user = fixture(:user)
      assert {:ok, _} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end
  end
end