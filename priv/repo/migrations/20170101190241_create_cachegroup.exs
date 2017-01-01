defmodule Tox.Repo.Migrations.CreateCachegroup do
  use Ecto.Migration

  def change do
    create table(:cachegroups) do
      add :name, :string
      add :short_name, :string
      add :latitude, :float
      add :longitude, :float
      add :parent_cachegroup_id, :integer
      add :secondary_parent_cachegroup_id, :integer
      add :type, :integer

      timestamps()
    end

  end
end
