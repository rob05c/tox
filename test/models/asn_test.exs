defmodule Tox.AsnTest do
  use Tox.ModelCase

  alias Tox.Asn

  @valid_attrs %{asn: 42, cachegroup: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Asn.changeset(%Asn{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Asn.changeset(%Asn{}, @invalid_attrs)
    refute changeset.valid?
  end
end
