defmodule Tox.HtmlDeliveryServiceControllerTest do
  use Tox.ConnCase

  alias Tox.HtmlDeliveryService
  @valid_attrs %{dscp: 42, long_description: "some content", dns_bypass_ttl: 42, tr_response_headers: "some content", global_max_tps: 42, range_request_handling: 42, last_updated: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, initial_dispersion: 42, origin_fqdn: "some content", mid_header_rewrite: "some content", ssl_key_version: 42, cdn_id: 42, edge_header_rewrite: "some content", type: 42, regex_remap: "some content", tr_request_headers: "some content", cacheurl: "some content", origin_shield: "some content", active: true, dns_bypass_name: "some content", xml_id: "some content", protocol: 42, display_name: "some content", html_bypass_fqdn: "some content", global_max_mbps: 42, check_path: "some content", multi_site_origin: true, ccr_dns_ttl: 42, miss_longitude: "120.5", geo_limit: true, ipv6_routing_enabled: true, profile: 42, signed: true, info_url: "some content", dns_bypass_ip6: "some content", dns_bypass_ip: "some content", miss_latitude: "120.5", max_dns_answers: 42, remap_text: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, html_delivery_service_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing deliveryservices"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, html_delivery_service_path(conn, :new)
    assert html_response(conn, 200) =~ "New html delivery service"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, html_delivery_service_path(conn, :create), html_delivery_service: @valid_attrs
    assert redirected_to(conn) == html_delivery_service_path(conn, :index)
    assert Repo.get_by(HtmlDeliveryService, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, html_delivery_service_path(conn, :create), html_delivery_service: @invalid_attrs
    assert html_response(conn, 200) =~ "New html delivery service"
  end

  test "shows chosen resource", %{conn: conn} do
    html_delivery_service = Repo.insert! %HtmlDeliveryService{}
    conn = get conn, html_delivery_service_path(conn, :show, html_delivery_service)
    assert html_response(conn, 200) =~ "Show html delivery service"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, html_delivery_service_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    html_delivery_service = Repo.insert! %HtmlDeliveryService{}
    conn = get conn, html_delivery_service_path(conn, :edit, html_delivery_service)
    assert html_response(conn, 200) =~ "Edit html delivery service"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    html_delivery_service = Repo.insert! %HtmlDeliveryService{}
    conn = put conn, html_delivery_service_path(conn, :update, html_delivery_service), html_delivery_service: @valid_attrs
    assert redirected_to(conn) == html_delivery_service_path(conn, :show, html_delivery_service)
    assert Repo.get_by(HtmlDeliveryService, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    html_delivery_service = Repo.insert! %HtmlDeliveryService{}
    conn = put conn, html_delivery_service_path(conn, :update, html_delivery_service), html_delivery_service: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit html delivery service"
  end

  test "deletes chosen resource", %{conn: conn} do
    html_delivery_service = Repo.insert! %HtmlDeliveryService{}
    conn = delete conn, html_delivery_service_path(conn, :delete, html_delivery_service)
    assert redirected_to(conn) == html_delivery_service_path(conn, :index)
    refute Repo.get(HtmlDeliveryService, html_delivery_service.id)
  end
end
