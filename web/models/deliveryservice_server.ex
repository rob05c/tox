defmodule Tox.DeliveryserviceServer do
  use Tox.Web, :model

  schema "deliveryserviceservers" do
    field :deliveryservice, :integer
    field :server_host, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:deliveryservice, :server_host])
    |> validate_required([:deliveryservice, :server_host])
  end
end
