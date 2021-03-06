defmodule Website.User do
  use Website.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :username, :string
    field :password, :string, virtual: true

    timestamps
  end

  @required_fields ~w(email password username)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> validate_length(:username, min: 3)
    |> validate_length(:username, max: 50)
  end

  def is_admin?(user) do
    mail = user.email
    Enum.member?(Application.get_env(:website, :admins), mail)
  end
end
