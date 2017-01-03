defmodule Tox.Repo.Migrations.CreateRegex do
  use Ecto.Migration

  def change do
    create table(:regexes) do
      add :pattern, :text
      add :type, references(:regex_types, column: :name, type: :text)
      timestamps()
    end

  end
end
