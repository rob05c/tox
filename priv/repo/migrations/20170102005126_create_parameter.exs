defmodule Tox.Repo.Migrations.CreateParameter do
  use Ecto.Migration

  def change do
    create table(:parameters) do
      add :name, :string
      add :config_file, :string
      add :value, :string
      add :secure, :boolean, default: false, null: false

      timestamps()
    end

  end
end
