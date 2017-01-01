defmodule Tox.Repo.Migrations.CreateFederation do
  use Ecto.Migration

  def change do
    create table(:federations) do
      add :cname, :string
      add :description, :string
      add :ttl, :string

      timestamps()
    end

  end
end
