defmodule Tox.Repo.Migrations.CreateDeliveryserviceRegex do
  use Ecto.Migration

  def change do
    create table(:deliveryserviceregexes) do
      add :deliveryservice, :integer
      add :regex, :integer
      add :set_number, :integer

      timestamps()
    end

  end
end
