defmodule Tox.FederationTest do
  use Tox.ModelCase

  alias Tox.Federation

  @valid_attrs %{cname: "some content", description: "some content", ttl: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Federation.changeset(%Federation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Federation.changeset(%Federation{}, @invalid_attrs)
    refute changeset.valid?
  end
end
