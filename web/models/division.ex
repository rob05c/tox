defmodule Tox.Division do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :name}
  schema "divisions" do
    field :name, :string, primary_key: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
