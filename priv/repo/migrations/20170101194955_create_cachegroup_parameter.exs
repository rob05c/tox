defmodule Tox.Repo.Migrations.CreateCachegroupParameter do
  use Ecto.Migration

  def change do
    create table(:cachegroupparameters) do
      add :cachegroup, :integer
      add :parameter, :integer

      timestamps()
    end

  end
end
