defmodule Tox.DeliveryserviceServer do
  use Tox.Web, :model

  schema "deliveryserviceservers" do
    field :deliveryservice, :integer
    field :server, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:deliveryservice, :server])
    |> validate_required([:deliveryservice, :server])
  end
end
