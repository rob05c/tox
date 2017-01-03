defmodule Tox.Repo.Migrations.CreateProfile do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :name, :text, primary_key: true
      add :description, :text

      timestamps()
    end

  end
end
