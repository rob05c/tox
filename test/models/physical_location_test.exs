defmodule Tox.PhysicalLocationTest do
  use Tox.ModelCase

  alias Tox.PhysicalLocation

  @valid_attrs %{address: "some content", city: "some content", comments: "some content", email: "some content", name: "some content", phone: "some content", poc: "some content", region: 42, short_name: "some content", state: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PhysicalLocation.changeset(%PhysicalLocation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PhysicalLocation.changeset(%PhysicalLocation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
