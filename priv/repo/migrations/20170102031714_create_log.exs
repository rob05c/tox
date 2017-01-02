defmodule Tox.Repo.Migrations.CreateLog do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :level, :string
      add :message, :string
      add :user, :integer
      add :ticketnum, :string

      timestamps()
    end

  end
end
