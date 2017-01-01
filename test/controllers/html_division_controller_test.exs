defmodule Tox.HtmlDivisionControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlDivision
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_division_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing divisions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_division_path(conn, :new)
    assert html_response(conn, 200) =~ "New html division"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_division_path(conn, :create), html_division: @valid_attrs
    assert redirected_to(conn) == html_division_path(conn, :index)
    assert Repo.get_by(HtmlDivision, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_division_path(conn, :create), html_division: @invalid_attrs
    assert html_response(conn, 200) =~ "New html division"
  end

  test "shows chosen resource", %{conn: conn} do
    html_division = Repo.insert! %HtmlDivision{}
    conn = get conn, html_division_path(conn, :show, html_division)
    assert html_response(conn, 200) =~ "Show html division"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_division_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_division = Repo.insert! %HtmlDivision{}
    conn = get conn, html_division_path(conn, :edit, html_division)
    assert html_response(conn, 200) =~ "Edit html division"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_division = Repo.insert! %HtmlDivision{}
    conn = put conn, html_division_path(conn, :update, html_division), html_division: @valid_attrs
    assert redirected_to(conn) == html_division_path(conn, :show, html_division)
    assert Repo.get_by(HtmlDivision, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_division = Repo.insert! %HtmlDivision{}
    conn = put conn, html_division_path(conn, :update, html_division), html_division: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html division"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_division = Repo.insert! %HtmlDivision{}
    conn = delete conn, html_division_path(conn, :delete, html_division)
    assert redirected_to(conn) == html_division_path(conn, :index)
    refute Repo.get(HtmlDivision, html_division.id)
  end
end
