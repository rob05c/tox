defmodule Tox.HtmlDeliveryserviceServerControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlDeliveryserviceServer
  @valid_attrs %{deliveryservice: 42, server: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_deliveryservice_server_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing deliveryserviceservers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_deliveryservice_server_path(conn, :new)
    assert html_response(conn, 200) =~ "New html deliveryservice server"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_deliveryservice_server_path(conn, :create), html_deliveryservice_server: @valid_attrs
    assert redirected_to(conn) == html_deliveryservice_server_path(conn, :index)
    assert Repo.get_by(HtmlDeliveryserviceServer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_deliveryservice_server_path(conn, :create), html_deliveryservice_server: @invalid_attrs
    assert html_response(conn, 200) =~ "New html deliveryservice server"
  end

  test "shows chosen resource", %{conn: conn} do
    html_deliveryservice_server = Repo.insert! %HtmlDeliveryserviceServer{}
    conn = get conn, html_deliveryservice_server_path(conn, :show, html_deliveryservice_server)
    assert html_response(conn, 200) =~ "Show html deliveryservice server"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_deliveryservice_server_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_deliveryservice_server = Repo.insert! %HtmlDeliveryserviceServer{}
    conn = get conn, html_deliveryservice_server_path(conn, :edit, html_deliveryservice_server)
    assert html_response(conn, 200) =~ "Edit html deliveryservice server"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_deliveryservice_server = Repo.insert! %HtmlDeliveryserviceServer{}
    conn = put conn, html_deliveryservice_server_path(conn, :update, html_deliveryservice_server), html_deliveryservice_server: @valid_attrs
    assert redirected_to(conn) == html_deliveryservice_server_path(conn, :show, html_deliveryservice_server)
    assert Repo.get_by(HtmlDeliveryserviceServer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_deliveryservice_server = Repo.insert! %HtmlDeliveryserviceServer{}
    conn = put conn, html_deliveryservice_server_path(conn, :update, html_deliveryservice_server), html_deliveryservice_server: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html deliveryservice server"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_deliveryservice_server = Repo.insert! %HtmlDeliveryserviceServer{}
    conn = delete conn, html_deliveryservice_server_path(conn, :delete, html_deliveryservice_server)
    assert redirected_to(conn) == html_deliveryservice_server_path(conn, :index)
    refute Repo.get(HtmlDeliveryserviceServer, html_deliveryservice_server.id)
  end
end
