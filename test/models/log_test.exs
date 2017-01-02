defmodule Tox.LogTest do
  use Tox.ModelCase

  alias Tox.Log

  @valid_attrs %{level: "some content", message: "some content", ticketnum: "some content", user: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Log.changeset(%Log{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Log.changeset(%Log{}, @invalid_attrs)
    refute changeset.valid?
  end
end
