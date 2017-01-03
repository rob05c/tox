defmodule Tox.Repo.Migrations.CreateRegion do
  use Ecto.Migration

  def change do
    create table(:regions, primary_key: false) do
      add :name, :text, primary_key: true
      add :division, references(:divisions, column: :name, type: :text)
      timestamps()
    end

  end
end
