defmodule Tox.HardwareTest do
  use Tox.ModelCase

  alias Tox.Hardware

  @valid_attrs %{description: "some content", server: 42, value: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hardware.changeset(%Hardware{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hardware.changeset(%Hardware{}, @invalid_attrs)
    refute changeset.valid?
  end
end
