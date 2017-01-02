defmodule Tox.Region do
  use Tox.Web, :model

  schema "regions" do
    field :name, :string
    field :division, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :division])
    |> validate_required([:name, :division])
  end
end
