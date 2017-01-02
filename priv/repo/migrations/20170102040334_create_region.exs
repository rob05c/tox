defmodule Tox.Repo.Migrations.CreateRegion do
  use Ecto.Migration

  def change do
    create table(:regions) do
      add :name, :string
      add :division, :integer

      timestamps()
    end

  end
end
