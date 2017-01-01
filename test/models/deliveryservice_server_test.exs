defmodule Tox.DeliveryserviceServerTest do
  use Tox.ModelCase

  alias Tox.DeliveryserviceServer

  @valid_attrs %{deliveryservice: 42, server: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DeliveryserviceServer.changeset(%DeliveryserviceServer{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DeliveryserviceServer.changeset(%DeliveryserviceServer{}, @invalid_attrs)
    refute changeset.valid?
  end
end
