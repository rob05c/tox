defmodule Tox.Repo.Migrations.CreateType do
  use Ecto.Migration

  def change do
    create table(:types, primary_key: false) do
      add :name, :text, primary_key: true
      add :description, :text
      add :use_in_table, :text

      timestamps()
    end

  end
end
