defmodule Website.MeetupTest do
  use Website.ModelCase

  alias Website.Meetup

  @valid_attrs %{date: "2010-04-17 14:00:00", description: "some content", location: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Meetup.changeset(%Meetup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Meetup.changeset(%Meetup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
