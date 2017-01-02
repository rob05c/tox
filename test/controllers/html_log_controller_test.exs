defmodule Tox.HtmlLogControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlLog
  @valid_attrs %{level: "some content", message: "some content", ticketnum: "some content", user: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_log_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing logs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_log_path(conn, :new)
    assert html_response(conn, 200) =~ "New html log"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_log_path(conn, :create), html_log: @valid_attrs
    assert redirected_to(conn) == html_log_path(conn, :index)
    assert Repo.get_by(HtmlLog, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_log_path(conn, :create), html_log: @invalid_attrs
    assert html_response(conn, 200) =~ "New html log"
  end

  test "shows chosen resource", %{conn: conn} do
    html_log = Repo.insert! %HtmlLog{}
    conn = get conn, html_log_path(conn, :show, html_log)
    assert html_response(conn, 200) =~ "Show html log"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_log_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_log = Repo.insert! %HtmlLog{}
    conn = get conn, html_log_path(conn, :edit, html_log)
    assert html_response(conn, 200) =~ "Edit html log"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_log = Repo.insert! %HtmlLog{}
    conn = put conn, html_log_path(conn, :update, html_log), html_log: @valid_attrs
    assert redirected_to(conn) == html_log_path(conn, :show, html_log)
    assert Repo.get_by(HtmlLog, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_log = Repo.insert! %HtmlLog{}
    conn = put conn, html_log_path(conn, :update, html_log), html_log: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html log"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_log = Repo.insert! %HtmlLog{}
    conn = delete conn, html_log_path(conn, :delete, html_log)
    assert redirected_to(conn) == html_log_path(conn, :index)
    refute Repo.get(HtmlLog, html_log.id)
  end
end
