defmodule Tox.Regex do
  use Tox.Web, :model

  schema "regexes" do
    field :pattern, :string
    field :type, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:pattern, :type])
    |> validate_required([:pattern, :type])
  end
end
