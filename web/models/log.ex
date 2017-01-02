defmodule Tox.Log do
  use Tox.Web, :model

  schema "logs" do
    field :level, :string
    field :message, :string
    field :user, :integer
    field :ticketnum, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:level, :message, :user, :ticketnum])
    |> validate_required([:message, :user])
  end
end
