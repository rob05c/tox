defmodule Tox.ParameterTest do
  use Tox.ModelCase

  alias Tox.Parameter

  @valid_attrs %{config_file: "some content", name: "some content", secure: true, value: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Parameter.changeset(%Parameter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Parameter.changeset(%Parameter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
