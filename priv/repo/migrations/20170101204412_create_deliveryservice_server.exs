defmodule Tox.Repo.Migrations.CreateDeliveryserviceServer do
  use Ecto.Migration

  def change do
    create table(:deliveryserviceservers) do
      add :deliveryservice, references(:deliveryservices, column: :xml_id, type: :text)
      add :server_host, references(:servers, column: :host, type: :text)
      timestamps()
    end
  end
end
