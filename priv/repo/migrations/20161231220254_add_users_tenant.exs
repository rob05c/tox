defmodule Tox.Repo.Migrations.AddUsersTenant do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :tenant, :string
    end
  end
end
