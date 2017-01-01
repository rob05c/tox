defmodule Tox.Asn do
  use Tox.Web, :model

  schema "asns" do
    field :asn, :integer
    field :cachegroup, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:asn, :cachegroup])
    |> validate_required([:asn, :cachegroup])
  end
end
