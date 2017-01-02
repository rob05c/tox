defmodule Tox.RegionTest do
  use Tox.ModelCase

  alias Tox.Region

  @valid_attrs %{division: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Region.changeset(%Region{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Region.changeset(%Region{}, @invalid_attrs)
    refute changeset.valid?
  end
end
