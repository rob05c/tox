defmodule Tox.Repo.Migrations.AddDeliveryservicesTenant do
  use Ecto.Migration

  def change do
    alter table(:deliveryservices) do
      add :tenant, :text
    end
  end
end
