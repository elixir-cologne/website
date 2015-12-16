defmodule Website.Repo.Migrations.CreateMeetup do
  use Ecto.Migration

  def change do
    create table(:meetups) do
      add :title, :string
      add :description, :text
      add :location, :string
      add :date, :datetime

      timestamps
    end

  end
end
