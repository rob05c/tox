defmodule Tox.Repo.Migrations.AddUsersRoles do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :text
    end
  end
end
