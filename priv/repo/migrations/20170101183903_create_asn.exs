defmodule Tox.Repo.Migrations.CreateAsn do
  use Ecto.Migration

  def change do
    create table(:asns) do
      add :asn, :integer
      add :cachegroup, :integer

      timestamps()
    end

  end
end
