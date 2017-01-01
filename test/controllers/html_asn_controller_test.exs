defmodule Tox.HtmlAsnControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlAsn
  @valid_attrs %{asn: 42, cachegroup: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_asn_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing asns"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_asn_path(conn, :new)
    assert html_response(conn, 200) =~ "New html asn"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_asn_path(conn, :create), html_asn: @valid_attrs
    assert redirected_to(conn) == html_asn_path(conn, :index)
    assert Repo.get_by(HtmlAsn, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_asn_path(conn, :create), html_asn: @invalid_attrs
    assert html_response(conn, 200) =~ "New html asn"
  end

  test "shows chosen resource", %{conn: conn} do
    html_asn = Repo.insert! %HtmlAsn{}
    conn = get conn, html_asn_path(conn, :show, html_asn)
    assert html_response(conn, 200) =~ "Show html asn"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_asn_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_asn = Repo.insert! %HtmlAsn{}
    conn = get conn, html_asn_path(conn, :edit, html_asn)
    assert html_response(conn, 200) =~ "Edit html asn"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_asn = Repo.insert! %HtmlAsn{}
    conn = put conn, html_asn_path(conn, :update, html_asn), html_asn: @valid_attrs
    assert redirected_to(conn) == html_asn_path(conn, :show, html_asn)
    assert Repo.get_by(HtmlAsn, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_asn = Repo.insert! %HtmlAsn{}
    conn = put conn, html_asn_path(conn, :update, html_asn), html_asn: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html asn"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_asn = Repo.insert! %HtmlAsn{}
    conn = delete conn, html_asn_path(conn, :delete, html_asn)
    assert redirected_to(conn) == html_asn_path(conn, :index)
    refute Repo.get(HtmlAsn, html_asn.id)
  end
end
