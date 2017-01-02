defmodule Tox.Repo.Migrations.CreatePhysicalLocation do
  use Ecto.Migration

  def change do
    create table(:physicallocations) do
      add :name, :string
      add :short_name, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :poc, :string
      add :phone, :string
      add :email, :string
      add :comments, :string
      add :region, :integer

      timestamps()
    end

  end
end
