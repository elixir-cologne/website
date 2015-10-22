defmodule Website.UserTest do
  use Website.ModelCase

  alias Website.User

  @valid_attrs %{password: "some content", email: "some@content.com", username: "tim"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "is_admin " do
    tim = %User{email: "tim@buchwaldt.ws"}
    assert User.is_admin?(tim)

    other_user = %User{email: "user@example.com"}
    refute User.is_admin?(other_user)
  end

end
