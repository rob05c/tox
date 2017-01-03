defmodule Tox.Repo.Migrations.CreateAsn do
  use Ecto.Migration

  def change do
    create table(:asns, primary_key: false) do
      add :asn, :integer, primary_key: true
      add :cachegroup, references(:cachegroups, column: :name, type: :text)

      timestamps()
    end

  end
end
