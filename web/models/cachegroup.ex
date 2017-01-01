defmodule Tox.Cachegroup do
  use Tox.Web, :model

  schema "cachegroups" do
    field :name, :string
    field :short_name, :string
    field :latitude, :float
    field :longitude, :float
    field :parent_cachegroup_id, :integer
    field :secondary_parent_cachegroup_id, :integer
    field :type, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :short_name, :latitude, :longitude, :parent_cachegroup_id, :secondary_parent_cachegroup_id, :type])
    |> validate_required([:name, :short_name, :type])
  end
end
