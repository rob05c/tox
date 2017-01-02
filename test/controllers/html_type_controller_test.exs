defmodule Tox.HtmlTypeControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlType
  @valid_attrs %{description: "some content", name: "some content", use_in_table: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_type_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing types"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_type_path(conn, :new)
    assert html_response(conn, 200) =~ "New html type"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_type_path(conn, :create), html_type: @valid_attrs
    assert redirected_to(conn) == html_type_path(conn, :index)
    assert Repo.get_by(HtmlType, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_type_path(conn, :create), html_type: @invalid_attrs
    assert html_response(conn, 200) =~ "New html type"
  end

  test "shows chosen resource", %{conn: conn} do
    html_type = Repo.insert! %HtmlType{}
    conn = get conn, html_type_path(conn, :show, html_type)
    assert html_response(conn, 200) =~ "Show html type"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_type_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_type = Repo.insert! %HtmlType{}
    conn = get conn, html_type_path(conn, :edit, html_type)
    assert html_response(conn, 200) =~ "Edit html type"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_type = Repo.insert! %HtmlType{}
    conn = put conn, html_type_path(conn, :update, html_type), html_type: @valid_attrs
    assert redirected_to(conn) == html_type_path(conn, :show, html_type)
    assert Repo.get_by(HtmlType, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_type = Repo.insert! %HtmlType{}
    conn = put conn, html_type_path(conn, :update, html_type), html_type: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html type"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_type = Repo.insert! %HtmlType{}
    conn = delete conn, html_type_path(conn, :delete, html_type)
    assert redirected_to(conn) == html_type_path(conn, :index)
    refute Repo.get(HtmlType, html_type.id)
  end
end
