defmodule Tox.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :email, :text, primary_key: true
      add :password_hash, :text

      timestamps()
    end

  end
end
