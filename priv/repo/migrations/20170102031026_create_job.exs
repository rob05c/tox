defmodule Tox.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :agent, :integer
      add :object_type, :text
      add :object_name, :text
      add :keyword, :text
      add :parameters, :text
      add :asset_url, :text
      add :asset_type, :text
      add :status, :integer
      add :start_time, :datetime
      add :entered_time, :datetime
      add :job_user, :integer
      add :job_deliveryservice, :integer

      timestamps()
    end

  end
end
