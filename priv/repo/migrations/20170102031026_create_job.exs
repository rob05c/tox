defmodule Tox.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :agent, :integer
      add :object_type, :string
      add :object_name, :string
      add :keyword, :string
      add :parameters, :string
      add :asset_url, :string
      add :asset_type, :string
      add :status, :integer
      add :start_time, :datetime
      add :entered_time, :datetime
      add :job_user, :integer
      add :job_deliveryservice, :integer

      timestamps()
    end

  end
end
