defmodule Tox.CdnTest do
  use Tox.ModelCase

  alias Tox.Cdn

  @valid_attrs %{dnssec_enabled: true, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cdn.changeset(%Cdn{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cdn.changeset(%Cdn{}, @invalid_attrs)
    refute changeset.valid?
  end
end
