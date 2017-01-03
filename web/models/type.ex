defmodule Tox.Type do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :name}
  schema "types" do
    field :name, :string, primary_key: true
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
    |> validate_required([:name])
  end
end
