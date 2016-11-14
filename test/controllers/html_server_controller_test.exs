defmodule Tox.HtmlServerControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlServer
  @valid_attrs %{cachegroup: 42, cdn: 42, domain_name: "some content", host_name: "some content", ilo_ip_address: "some content", ilo_ip_gateway: "some content", ilo_ip_netmask: "some content", ilo_password: "some content", ilo_username: "some content", interface_mtu: "some content", interface_name: "some content", ip6_address: "some content", ip6_gateway: "some content", ip_address: "some content", ip_gateway: "some content", ip_netmask: "some content", last_updated: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, management_ip_address: "some content", management_ip_gateway: "some content", management_ip_netmask: "some content", physical_location: 42, profile: 42, rack: "some content", router_host_name: "some content", router_port_name: "some content", tcp_port: 42, type: 42, update_pending: true, xmpp_id: "some content", xmpp_password: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_server_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing servers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_server_path(conn, :new)
    assert html_response(conn, 200) =~ "New html server"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_server_path(conn, :create), html_server: @valid_attrs
    assert redirected_to(conn) == html_server_path(conn, :index)
    assert Repo.get_by(HtmlServer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_server_path(conn, :create), html_server: @invalid_attrs
    assert html_response(conn, 200) =~ "New html server"
  end

  test "shows chosen resource", %{conn: conn} do
    html_server = Repo.insert! %HtmlServer{}
    conn = get conn, html_server_path(conn, :show, html_server)
    assert html_response(conn, 200) =~ "Show html server"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_server_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_server = Repo.insert! %HtmlServer{}
    conn = get conn, html_server_path(conn, :edit, html_server)
    assert html_response(conn, 200) =~ "Edit html server"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_server = Repo.insert! %HtmlServer{}
    conn = put conn, html_server_path(conn, :update, html_server), html_server: @valid_attrs
    assert redirected_to(conn) == html_server_path(conn, :show, html_server)
    assert Repo.get_by(HtmlServer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_server = Repo.insert! %HtmlServer{}
    conn = put conn, html_server_path(conn, :update, html_server), html_server: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html server"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_server = Repo.insert! %HtmlServer{}
    conn = delete conn, html_server_path(conn, :delete, html_server)
    assert redirected_to(conn) == html_server_path(conn, :index)
    refute Repo.get(HtmlServer, html_server.id)
  end
end
