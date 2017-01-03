defmodule Tox.Repo.Migrations.CreateDivision do
  use Ecto.Migration

  def change do
    create table(:divisions, primary_key: false) do
      add :name, :text, primary_key: true

      timestamps()
    end

  end
end
