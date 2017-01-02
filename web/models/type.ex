defmodule Tox.Type do
  use Tox.Web, :model

  schema "types" do
    field :name, :string
    field :description, :string
    field :use_in_table, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :use_in_table])
    |> validate_required([:name, :description, :use_in_table])
  end
end
