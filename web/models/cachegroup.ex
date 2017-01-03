defmodule Tox.Cachegroup do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :name}
  schema "cachegroups" do
    field :name, :string, primary_key: true
    field :short_name, :string
    field :latitude, :float
    field :longitude, :float
    field :parent, :integer
    field :secondary_parent, :integer
    field :type, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :short_name, :latitude, :longitude, :parent, :secondary_parent, :type])
    |> validate_required([:name, :short_name, :type])
  end
end
