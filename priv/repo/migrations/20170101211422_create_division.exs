defmodule Tox.Repo.Migrations.CreateDivision do
  use Ecto.Migration

  def change do
    create table(:divisions) do
      add :name, :string

      timestamps()
    end

  end
end
