defmodule Tox.Repo.Migrations.CreateProfileParameter do
  use Ecto.Migration

  def change do
    create table(:profileparameters) do
      add :profile, references(:profiles, column: :name, type: :text)
      add :parameter, references(:parameters, column: :name, type: :text)
      timestamps()
    end

  end
end
