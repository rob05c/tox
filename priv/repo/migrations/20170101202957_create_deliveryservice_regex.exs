defmodule Tox.Repo.Migrations.CreateDeliveryserviceRegex do
  use Ecto.Migration

  def change do
    create table(:deliveryserviceregexes) do
      add :deliveryservice, references(:deliveryservices, column: :xml_id, type: :text)
      add :regex, references(:regexes)
      add :set_number, :integer

      timestamps()
    end

  end
end
