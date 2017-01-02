defmodule Tox.Hardware do
  use Tox.Web, :model

  schema "hardwares" do
    field :server, :integer
    field :description, :string
    field :value, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:server, :description, :value])
    |> validate_required([:server, :description, :value])
  end
end
