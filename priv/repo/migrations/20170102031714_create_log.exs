defmodule Tox.Repo.Migrations.CreateLog do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :level, :text
      add :message, :text
      add :user, :integer
      add :ticketnum, :text

      timestamps()
    end

  end
end
