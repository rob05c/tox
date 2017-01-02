defmodule Tox.Repo.Migrations.CreateProfileParameter do
  use Ecto.Migration

  def change do
    create table(:profileparameters) do
      add :profile, :integer
      add :parameter, :integer

      timestamps()
    end

  end
end
