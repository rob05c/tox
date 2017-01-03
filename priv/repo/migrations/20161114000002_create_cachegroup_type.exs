defmodule Tox.Repo.Migrations.CreateCachegroupType do
  use Ecto.Migration

  def change do
    create table(:cachegroup_types, primary_key: false) do
      add :name, :text, primary_key: true
      add :description, :text

      timestamps()
    end

  end
end
