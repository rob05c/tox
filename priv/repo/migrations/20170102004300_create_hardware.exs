defmodule Tox.Repo.Migrations.CreateHardware do
  use Ecto.Migration

  def change do
    create table(:hardwares, primary_key: false) do
      add :server_host, references(:servers, column: :host, type: :text), primary_key: true
      add :description, :text
      add :value, :text

      timestamps()
    end
  end
end
