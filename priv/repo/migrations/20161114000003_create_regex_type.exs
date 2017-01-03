defmodule Tox.Repo.Migrations.CreateRegexType do
  use Ecto.Migration

  def change do
    create table(:regex_types, primary_key: false) do
      add :name, :text, primary_key: true
      add :description, :text

      timestamps()
    end

  end
end
