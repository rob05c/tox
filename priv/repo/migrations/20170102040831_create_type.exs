defmodule Tox.Repo.Migrations.CreateType do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :name, :string
      add :description, :string
      add :use_in_table, :string

      timestamps()
    end

  end
end
