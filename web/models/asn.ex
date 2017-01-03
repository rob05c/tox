defmodule Tox.Asn do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :asn}
  schema "asns" do
    field :asn, :integer, primary_key: true
    field :cachegroup, :string

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
