defmodule Tox.DeliveryserviceRegexTest do
  use Tox.ModelCase

  alias Tox.DeliveryserviceRegex

  @valid_attrs %{deliveryservice: 42, regex: 42, set_number: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DeliveryserviceRegex.changeset(%DeliveryserviceRegex{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DeliveryserviceRegex.changeset(%DeliveryserviceRegex{}, @invalid_attrs)
    refute changeset.valid?
  end
end
