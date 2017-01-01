defmodule Tox.Repo.Migrations.CreateDeliveryserviceServer do
  use Ecto.Migration

  def change do
    create table(:deliveryserviceservers) do
      add :deliveryservice, :integer
      add :server, :integer

      timestamps()
    end

  end
end
