defmodule Tox.Repo.Migrations.CreateFederation do
  use Ecto.Migration

  def change do
    create table(:federations, primary_key: false) do
      add :cname, :text, primary_key: true
      add :description, :text
      add :ttl, :text

      timestamps()
    end

  end
end
