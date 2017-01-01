defmodule Tox.Federation do
  use Tox.Web, :model

  schema "federations" do
    field :cname, :string
    field :description, :string
    field :ttl, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:cname, :description, :ttl])
    |> validate_required([:cname, :ttl])
  end
end
