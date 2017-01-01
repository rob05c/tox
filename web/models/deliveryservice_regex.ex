defmodule Tox.DeliveryserviceRegex do
  use Tox.Web, :model

  schema "deliveryserviceregexes" do
    field :deliveryservice, :integer
    field :regex, :integer
    field :set_number, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:deliveryservice, :regex, :set_number])
    |> validate_required([:deliveryservice, :regex])
  end
end
