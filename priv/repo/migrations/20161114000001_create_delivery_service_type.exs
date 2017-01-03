defmodule Tox.Repo.Migrations.CreateDeliveryServiceType do
  use Ecto.Migration

  def change do
    create table(:delivery_service_types, primary_key: false) do
      add :name, :text, primary_key: true
      add :description, :text

      timestamps()
    end

  end
end
