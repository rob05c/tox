defmodule Tox.Repo.Migrations.AddUsersTenant do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :tenant, :text
    end
  end
end
