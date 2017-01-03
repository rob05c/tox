defmodule Tox.Repo.Migrations.AddCachegroupParents do
  use Ecto.Migration

  def change do
    alter table(:cachegroups, primary_key: false) do
      add :parent, references(:cachegroups, column: :name, type: :text)
      add :secondary_parent, references(:cachegroups, column: :name, type: :text)
    end
  end
end
