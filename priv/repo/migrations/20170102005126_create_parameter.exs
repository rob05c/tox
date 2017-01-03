defmodule Tox.Repo.Migrations.CreateParameter do
  use Ecto.Migration

  def change do
    create table(:parameters) do
      add :name, :text
      add :config_file, :text
      add :value, :text
      add :secure, :boolean, default: false, null: false
      timestamps()
    end
    create unique_index(:parameters, [:name])
  end
end
