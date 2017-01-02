defmodule Tox.Parameter do
  use Tox.Web, :model

  schema "parameters" do
    field :name, :string
    field :config_file, :string
    field :value, :string
    field :secure, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :config_file, :value, :secure])
    |> validate_required([:name, :config_file, :value, :secure])
  end
end
