defmodule Tox.HtmlCachegroupControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlCachegroup
  @valid_attrs %{latitude: "120.5", longitude: "120.5", name: "some content", parent_cachegroup_id: 42, secondary_parent_cachegroup_id: 42, short_name: "some content", type: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_cachegroup_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing cachegroups"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_cachegroup_path(conn, :new)
    assert html_response(conn, 200) =~ "New html cachegroup"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_cachegroup_path(conn, :create), html_cachegroup: @valid_attrs
    assert redirected_to(conn) == html_cachegroup_path(conn, :index)
    assert Repo.get_by(HtmlCachegroup, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_cachegroup_path(conn, :create), html_cachegroup: @invalid_attrs
    assert html_response(conn, 200) =~ "New html cachegroup"
  end

  test "shows chosen resource", %{conn: conn} do
    html_cachegroup = Repo.insert! %HtmlCachegroup{}
    conn = get conn, html_cachegroup_path(conn, :show, html_cachegroup)
    assert html_response(conn, 200) =~ "Show html cachegroup"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_cachegroup_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_cachegroup = Repo.insert! %HtmlCachegroup{}
    conn = get conn, html_cachegroup_path(conn, :edit, html_cachegroup)
    assert html_response(conn, 200) =~ "Edit html cachegroup"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_cachegroup = Repo.insert! %HtmlCachegroup{}
    conn = put conn, html_cachegroup_path(conn, :update, html_cachegroup), html_cachegroup: @valid_attrs
    assert redirected_to(conn) == html_cachegroup_path(conn, :show, html_cachegroup)
    assert Repo.get_by(HtmlCachegroup, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_cachegroup = Repo.insert! %HtmlCachegroup{}
    conn = put conn, html_cachegroup_path(conn, :update, html_cachegroup), html_cachegroup: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html cachegroup"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_cachegroup = Repo.insert! %HtmlCachegroup{}
    conn = delete conn, html_cachegroup_path(conn, :delete, html_cachegroup)
    assert redirected_to(conn) == html_cachegroup_path(conn, :index)
    refute Repo.get(HtmlCachegroup, html_cachegroup.id)
  end
end
