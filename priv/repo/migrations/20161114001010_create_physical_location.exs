defmodule Tox.Repo.Migrations.CreatePhysicalLocation do
  use Ecto.Migration

  def change do
    create table(:physicallocations, primary_key: false) do
      add :name, :text, primary_key: true
      add :short_name, :text
      add :address, :text
      add :city, :text
      add :state, :text
      add :zip, :text
      add :poc, :text
      add :phone, :text
      add :email, :text
      add :comments, :text
      add :region, references(:regions, column: :name, type: :text)

      timestamps()
    end

  end
end
