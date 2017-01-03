defmodule Tox.Region do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :name}
  schema "regions" do
    field :name, :string, primary_key: true
    field :division, :string

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
