defmodule Tox.Repo.Migrations.CreateCdn do
  use Ecto.Migration

  def change do
    create table(:cdns) do
      add :name, :string
      add :dnssec_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
