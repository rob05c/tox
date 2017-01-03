defmodule Tox.Federation do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :cname}
  schema "federations" do
    field :cname, :string, primary_key: true
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
