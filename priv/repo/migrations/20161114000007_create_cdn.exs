defmodule Tox.Repo.Migrations.CreateCdn do
  use Ecto.Migration

  def change do
    create table(:cdns, primary_key: false) do
      add :name, :text, primary_key: true
      add :dnssec_enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
