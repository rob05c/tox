defmodule Tox.ProfileParameter do
  use Tox.Web, :model

  schema "profileparameters" do
    field :profile, :integer
    field :parameter, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:profile, :parameter])
    |> validate_required([:profile, :parameter])
  end
end
