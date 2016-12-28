defmodule Tox.User do
  use Tox.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ~w(email), [])
    |> validate_format(:email, ~r/@/)
  end
end
