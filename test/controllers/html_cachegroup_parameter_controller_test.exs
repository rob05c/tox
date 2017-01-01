defmodule Tox.HtmlCachegroupParameterControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlCachegroupParameter
  @valid_attrs %{cachegroup: 42, parameter: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_cachegroup_parameter_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing cachegroupparameters"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_cachegroup_parameter_path(conn, :new)
    assert html_response(conn, 200) =~ "New html cachegroup parameter"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_cachegroup_parameter_path(conn, :create), html_cachegroup_parameter: @valid_attrs
    assert redirected_to(conn) == html_cachegroup_parameter_path(conn, :index)
    assert Repo.get_by(HtmlCachegroupParameter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_cachegroup_parameter_path(conn, :create), html_cachegroup_parameter: @invalid_attrs
    assert html_response(conn, 200) =~ "New html cachegroup parameter"
  end

  test "shows chosen resource", %{conn: conn} do
    html_cachegroup_parameter = Repo.insert! %HtmlCachegroupParameter{}
    conn = get conn, html_cachegroup_parameter_path(conn, :show, html_cachegroup_parameter)
    assert html_response(conn, 200) =~ "Show html cachegroup parameter"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_cachegroup_parameter_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_cachegroup_parameter = Repo.insert! %HtmlCachegroupParameter{}
    conn = get conn, html_cachegroup_parameter_path(conn, :edit, html_cachegroup_parameter)
    assert html_response(conn, 200) =~ "Edit html cachegroup parameter"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_cachegroup_parameter = Repo.insert! %HtmlCachegroupParameter{}
    conn = put conn, html_cachegroup_parameter_path(conn, :update, html_cachegroup_parameter), html_cachegroup_parameter: @valid_attrs
    assert redirected_to(conn) == html_cachegroup_parameter_path(conn, :show, html_cachegroup_parameter)
    assert Repo.get_by(HtmlCachegroupParameter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_cachegroup_parameter = Repo.insert! %HtmlCachegroupParameter{}
    conn = put conn, html_cachegroup_parameter_path(conn, :update, html_cachegroup_parameter), html_cachegroup_parameter: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html cachegroup parameter"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_cachegroup_parameter = Repo.insert! %HtmlCachegroupParameter{}
    conn = delete conn, html_cachegroup_parameter_path(conn, :delete, html_cachegroup_parameter)
    assert redirected_to(conn) == html_cachegroup_parameter_path(conn, :index)
    refute Repo.get(HtmlCachegroupParameter, html_cachegroup_parameter.id)
  end
end
