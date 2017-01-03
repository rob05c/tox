defmodule Tox.Repo.Migrations.CreateCachegroupParameter do
  use Ecto.Migration

  def change do
    create table(:cachegroupparameters) do
      add :cachegroup, references(:cachegroups, column: :name, type: :text)
      add :parameter, references(:parameters, column: :name, type: :text)
      timestamps()
    end

  end
end
