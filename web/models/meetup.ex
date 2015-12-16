defmodule Website.Meetup do
  use Website.Web, :model

  schema "meetups" do
    field :title, :string
    field :description, :string
    field :location, :string
    field :date, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(title description location date)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:title, min: 5, max: 100)
    |> validate_length(:description, min: 5, max: 2500)
    |> validate_length(:location, min: 5, max: 100)
  end

  def ordered_by_date do
    query = from m in Website.Meetup,
      order_by: [desc: m.date]
    Website.Repo.all(query)
  end

  def next do
    current_time = Ecto.DateTime.local
    query = from m in Website.Meetup,
        where: m.date >= ^current_time,
        order_by: [desc: m.date]
    Website.Repo.one(query)
  end
end
