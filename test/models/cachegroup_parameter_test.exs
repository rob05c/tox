defmodule Tox.CachegroupParameterTest do
  use Tox.ModelCase

  alias Tox.CachegroupParameter

  @valid_attrs %{cachegroup: 42, parameter: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CachegroupParameter.changeset(%CachegroupParameter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CachegroupParameter.changeset(%CachegroupParameter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
