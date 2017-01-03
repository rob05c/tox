defmodule Tox.Hardware do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :server_host}
  schema "hardwares" do
    field :server_host, :string, primary_key: true
    field :description, :string
    field :value, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:server_host, :description, :value])
    |> validate_required([:server_host, :description, :value])
  end
end
