defmodule Tox.Cdn do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :name}
  schema "cdns" do
    field :name, :string, primary_key: true
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
