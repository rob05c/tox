defmodule Tox.CachegroupParameter do
  use Tox.Web, :model

  schema "cachegroupparameters" do
    field :cachegroup, :integer
    field :parameter, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:cachegroup, :parameter])
    |> validate_required([:cachegroup, :parameter])
  end
end
