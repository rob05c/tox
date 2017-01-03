defmodule Tox.Repo.Migrations.CreateServerType do
  use Ecto.Migration

  def change do
    create table(:server_types, primary_key: false) do
      add :name, :text, primary_key: true
      add :description, :text

      timestamps()
    end

  end
end
