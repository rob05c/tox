defmodule Tox.HtmlCdnControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlCdn
  @valid_attrs %{dnssec_enabled: true, name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_cdn_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing cdns"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_cdn_path(conn, :new)
    assert html_response(conn, 200) =~ "New html cdn"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_cdn_path(conn, :create), html_cdn: @valid_attrs
    assert redirected_to(conn) == html_cdn_path(conn, :index)
    assert Repo.get_by(HtmlCdn, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_cdn_path(conn, :create), html_cdn: @invalid_attrs
    assert html_response(conn, 200) =~ "New html cdn"
  end

  test "shows chosen resource", %{conn: conn} do
    html_cdn = Repo.insert! %HtmlCdn{}
    conn = get conn, html_cdn_path(conn, :show, html_cdn)
    assert html_response(conn, 200) =~ "Show html cdn"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_cdn_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_cdn = Repo.insert! %HtmlCdn{}
    conn = get conn, html_cdn_path(conn, :edit, html_cdn)
    assert html_response(conn, 200) =~ "Edit html cdn"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_cdn = Repo.insert! %HtmlCdn{}
    conn = put conn, html_cdn_path(conn, :update, html_cdn), html_cdn: @valid_attrs
    assert redirected_to(conn) == html_cdn_path(conn, :show, html_cdn)
    assert Repo.get_by(HtmlCdn, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_cdn = Repo.insert! %HtmlCdn{}
    conn = put conn, html_cdn_path(conn, :update, html_cdn), html_cdn: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html cdn"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_cdn = Repo.insert! %HtmlCdn{}
    conn = delete conn, html_cdn_path(conn, :delete, html_cdn)
    assert redirected_to(conn) == html_cdn_path(conn, :index)
    refute Repo.get(HtmlCdn, html_cdn.id)
  end
end
