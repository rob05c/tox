defmodule Tox.PhysicalLocation do
  use Tox.Web, :model

  schema "physicallocations" do
    field :name, :string
    field :short_name, :string
    field :address, :string
    field :city, :string
    field :state, :string
    field :zip, :string
    field :poc, :string
    field :phone, :string
    field :email, :string
    field :comments, :string
    field :region, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :short_name, :address, :city, :state, :zip, :poc, :phone, :email, :comments, :region])
    |> validate_required([:name, :short_name, :address, :city, :state, :zip, :poc, :phone, :email, :comments, :region])
  end
end
