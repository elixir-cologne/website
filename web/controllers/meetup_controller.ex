defmodule Website.MeetupController do
  use Website.Web, :controller
  alias Website.Meetup

  def index(conn, _params) do
    meetups = Meetup.ordered_by_date
    render conn, meetups: meetups
  end

  def new(conn, _params) do
    changeset = Meetup.changeset(%Meetup{})
    render conn, changeset: changeset
  end

  def create(conn, %{"meetup" => meetup_params}) do
    require_admin(conn)

    changeset = Meetup.changeset(%Meetup{}, meetup_params)

    if changeset.valid? do
      Website.Repo.insert(changeset)
      conn
      |> put_flash(:info, "Meetup created")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> render("new.html", changeset: changeset)
    end
  end


  defp require_admin(conn) do
    unless(Website.Session.is_admin?(conn)) do
      conn |>
      redirect(to: "/login")
    end
  end
end
