defmodule Tox.ProfileParameterTest do
  use Tox.ModelCase

  alias Tox.ProfileParameter

  @valid_attrs %{parameter: 42, profile: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ProfileParameter.changeset(%ProfileParameter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ProfileParameter.changeset(%ProfileParameter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
