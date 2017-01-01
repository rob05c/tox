defmodule Tox.Cdn do
  use Tox.Web, :model

  schema "cdns" do
    field :name, :string
    field :dnssec_enabled, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :dnssec_enabled])
    |> validate_required([:name, :dnssec_enabled])
  end
end
