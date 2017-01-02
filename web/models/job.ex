defmodule Tox.Job do
  use Tox.Web, :model

  schema "jobs" do
    field :agent, :integer
    field :object_type, :string
    field :object_name, :string
    field :keyword, :string
    field :parameters, :string
    field :asset_url, :string
    field :asset_type, :string
    field :status, :integer
    field :start_time, Ecto.DateTime
    field :entered_time, Ecto.DateTime
    field :job_user, :integer
    field :job_deliveryservice, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:agent, :object_type, :object_name, :keyword, :parameters, :asset_url, :asset_type, :status, :start_time, :entered_time, :job_user, :job_deliveryservice])
    |> validate_required([:keyword, :asset_url, :asset_type, :status, :start_time, :entered_time, :job_user])
  end
end
