defmodule Tox.Repo.Migrations.CreateCachegroup do
  use Ecto.Migration

  def change do
    create table(:cachegroups, primary_key: false) do
      add :name, :text, primary_key: true
      add :short_name, :text
      add :latitude, :float
      add :longitude, :float
      add :type, references(:cachegroup_types, column: :name, type: :text)
      timestamps()
    end
    create unique_index(:cachegroups, [:name])
  end
end
