defmodule Tox.HtmlCachegroupTest do
  use Tox.ModelCase

  alias Tox.HtmlCachegroup

  @valid_attrs %{latitude: "120.5", longitude: "120.5", name: "some content", parent_cachegroup_id: 42, secondary_parent_cachegroup_id: 42, short_name: "some content", type: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = HtmlCachegroup.changeset(%HtmlCachegroup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = HtmlCachegroup.changeset(%HtmlCachegroup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
