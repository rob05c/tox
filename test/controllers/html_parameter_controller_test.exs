defmodule Tox.HtmlParameterControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlParameter
  @valid_attrs %{config_file: "some content", name: "some content", secure: true, value: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_parameter_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing parameters"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_parameter_path(conn, :new)
    assert html_response(conn, 200) =~ "New html parameter"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_parameter_path(conn, :create), html_parameter: @valid_attrs
    assert redirected_to(conn) == html_parameter_path(conn, :index)
    assert Repo.get_by(HtmlParameter, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_parameter_path(conn, :create), html_parameter: @invalid_attrs
    assert html_response(conn, 200) =~ "New html parameter"
  end

  test "shows chosen resource", %{conn: conn} do
    html_parameter = Repo.insert! %HtmlParameter{}
    conn = get conn, html_parameter_path(conn, :show, html_parameter)
    assert html_response(conn, 200) =~ "Show html parameter"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_parameter_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_parameter = Repo.insert! %HtmlParameter{}
    conn = get conn, html_parameter_path(conn, :edit, html_parameter)
    assert html_response(conn, 200) =~ "Edit html parameter"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_parameter = Repo.insert! %HtmlParameter{}
    conn = put conn, html_parameter_path(conn, :update, html_parameter), html_parameter: @valid_attrs
    assert redirected_to(conn) == html_parameter_path(conn, :show, html_parameter)
    assert Repo.get_by(HtmlParameter, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_parameter = Repo.insert! %HtmlParameter{}
    conn = put conn, html_parameter_path(conn, :update, html_parameter), html_parameter: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html parameter"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_parameter = Repo.insert! %HtmlParameter{}
    conn = delete conn, html_parameter_path(conn, :delete, html_parameter)
    assert redirected_to(conn) == html_parameter_path(conn, :index)
    refute Repo.get(HtmlParameter, html_parameter.id)
  end
end
