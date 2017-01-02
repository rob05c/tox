defmodule Tox.HtmlRegionControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlRegion
  @valid_attrs %{division: 42, name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_region_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing regions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_region_path(conn, :new)
    assert html_response(conn, 200) =~ "New html region"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_region_path(conn, :create), html_region: @valid_attrs
    assert redirected_to(conn) == html_region_path(conn, :index)
    assert Repo.get_by(HtmlRegion, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_region_path(conn, :create), html_region: @invalid_attrs
    assert html_response(conn, 200) =~ "New html region"
  end

  test "shows chosen resource", %{conn: conn} do
    html_region = Repo.insert! %HtmlRegion{}
    conn = get conn, html_region_path(conn, :show, html_region)
    assert html_response(conn, 200) =~ "Show html region"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_region_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_region = Repo.insert! %HtmlRegion{}
    conn = get conn, html_region_path(conn, :edit, html_region)
    assert html_response(conn, 200) =~ "Edit html region"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_region = Repo.insert! %HtmlRegion{}
    conn = put conn, html_region_path(conn, :update, html_region), html_region: @valid_attrs
    assert redirected_to(conn) == html_region_path(conn, :show, html_region)
    assert Repo.get_by(HtmlRegion, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_region = Repo.insert! %HtmlRegion{}
    conn = put conn, html_region_path(conn, :update, html_region), html_region: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html region"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_region = Repo.insert! %HtmlRegion{}
    conn = delete conn, html_region_path(conn, :delete, html_region)
    assert redirected_to(conn) == html_region_path(conn, :index)
    refute Repo.get(HtmlRegion, html_region.id)
  end
end
