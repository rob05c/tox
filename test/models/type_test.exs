defmodule Tox.TypeTest do
  use Tox.ModelCase

  alias Tox.Type

  @valid_attrs %{description: "some content", name: "some content", use_in_table: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Type.changeset(%Type{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Type.changeset(%Type{}, @invalid_attrs)
    refute changeset.valid?
  end
end
