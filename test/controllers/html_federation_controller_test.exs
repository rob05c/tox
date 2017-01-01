defmodule Tox.HtmlFederationControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlFederation
  @valid_attrs %{cname: "some content", description: "some content", ttl: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_federation_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing federations"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_federation_path(conn, :new)
    assert html_response(conn, 200) =~ "New html federation"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_federation_path(conn, :create), html_federation: @valid_attrs
    assert redirected_to(conn) == html_federation_path(conn, :index)
    assert Repo.get_by(HtmlFederation, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_federation_path(conn, :create), html_federation: @invalid_attrs
    assert html_response(conn, 200) =~ "New html federation"
  end

  test "shows chosen resource", %{conn: conn} do
    html_federation = Repo.insert! %HtmlFederation{}
    conn = get conn, html_federation_path(conn, :show, html_federation)
    assert html_response(conn, 200) =~ "Show html federation"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_federation_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_federation = Repo.insert! %HtmlFederation{}
    conn = get conn, html_federation_path(conn, :edit, html_federation)
    assert html_response(conn, 200) =~ "Edit html federation"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_federation = Repo.insert! %HtmlFederation{}
    conn = put conn, html_federation_path(conn, :update, html_federation), html_federation: @valid_attrs
    assert redirected_to(conn) == html_federation_path(conn, :show, html_federation)
    assert Repo.get_by(HtmlFederation, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_federation = Repo.insert! %HtmlFederation{}
    conn = put conn, html_federation_path(conn, :update, html_federation), html_federation: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html federation"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_federation = Repo.insert! %HtmlFederation{}
    conn = delete conn, html_federation_path(conn, :delete, html_federation)
    assert redirected_to(conn) == html_federation_path(conn, :index)
    refute Repo.get(HtmlFederation, html_federation.id)
  end
end
