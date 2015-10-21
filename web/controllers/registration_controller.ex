defmodule Website.RegistrationController do
  use Website.Web, :controller
  alias Website.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    if changeset.valid? do
      case Website.Registration.create(changeset, Website.Repo) do
        {:ok, user} ->
          conn
          |> put_flash(:info, "Your account was created")
          |> put_session(:current_user, user.id)
          |> redirect(to: "/")
        {:error, changeset} ->
          conn
          |> put_flash(:info, "Unable to create account")
          |> render("new.html", changeset: changeset)
        end
    else
      conn
      |> put_flash(:info, "Unable to create account")
      |> render("new.html", changeset: changeset)
    end
  end
end
