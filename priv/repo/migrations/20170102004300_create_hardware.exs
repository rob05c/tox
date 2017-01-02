defmodule Tox.Repo.Migrations.CreateHardware do
  use Ecto.Migration

  def change do
    create table(:hardwares) do
      add :server, :integer
      add :description, :string
      add :value, :string

      timestamps()
    end

  end
end
