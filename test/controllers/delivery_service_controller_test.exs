defmodule Tox.DeliveryServiceControllerTest do
  use Tox.ConnCase

  alias Tox.DeliveryService
  @valid_attrs %{global_max_tps: 42, origin_fqdn: "some content", html_bypass_fqdn: "some content", origin_shield: "some content", miss_longitude: "120.5", edge_header_rewrite: "some content", initial_dispersion: 42, multi_site_origin: true, last_updated: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, dns_bypass_ip: "some content", display_name: "some content", ssl_key_version: 42, dns_bypass_name: "some content", type: 42, tr_request_headers: "some content", ccr_dns_ttl: 42, active: true, global_max_mbps: 42, protocol: 42, max_dns_answers: 42, range_request_handling: 42, check_path: "some content", dns_bypass_ttl: 42, ipv6_routing_enabled: true, remap_text: "some content", dns_bypass_ip6: "some content", long_description: "some content", geo_limit: true, xml_id: "some content", tr_response_headers: "some content", profile: 42, signed: true, regex_remap: "some content", dscp: 42, miss_latitude: "120.5", info_url: "some content", cacheurl: "some content", mid_header_rewrite: "some content", cdn_id: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, delivery_service_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    delivery_service = Repo.insert! %DeliveryService{}
    conn = get conn, delivery_service_path(conn, :show, delivery_service)
    assert json_response(conn, 200)["data"] == %{"id" => delivery_service.id,
      "xml_id" => delivery_service.xml_id,
      "active" => delivery_service.active,
      "dscp" => delivery_service.dscp,
      "signed" => delivery_service.signed,
      "geo_limit" => delivery_service.geo_limit,
      "html_bypass_fqdn" => delivery_service.html_bypass_fqdn,
      "dns_bypass_ip" => delivery_service.dns_bypass_ip,
      "dns_bypass_ip6" => delivery_service.dns_bypass_ip6,
      "dns_bypass_ttl" => delivery_service.dns_bypass_ttl,
      "origin_fqdn" => delivery_service.origin_fqdn,
      "type" => delivery_service.type,
      "profile" => delivery_service.profile,
      "cdn_id" => delivery_service.cdn_id,
      "ccr_dns_ttl" => delivery_service.ccr_dns_ttl,
      "global_max_mbps" => delivery_service.global_max_mbps,
      "global_max_tps" => delivery_service.global_max_tps,
      "long_description" => delivery_service.long_description,
      "max_dns_answers" => delivery_service.max_dns_answers,
      "info_url" => delivery_service.info_url,
      "miss_latitude" => delivery_service.miss_latitude,
      "miss_longitude" => delivery_service.miss_longitude,
      "check_path" => delivery_service.check_path,
      "last_updated" => delivery_service.last_updated,
      "protocol" => delivery_service.protocol,
      "ssl_key_version" => delivery_service.ssl_key_version,
      "ipv6_routing_enabled" => delivery_service.ipv6_routing_enabled,
      "range_request_handling" => delivery_service.range_request_handling,
      "edge_header_rewrite" => delivery_service.edge_header_rewrite,
      "origin_shield" => delivery_service.origin_shield,
      "mid_header_rewrite" => delivery_service.mid_header_rewrite,
      "regex_remap" => delivery_service.regex_remap,
      "cacheurl" => delivery_service.cacheurl,
      "remap_text" => delivery_service.remap_text,
      "multi_site_origin" => delivery_service.multi_site_origin,
      "display_name" => delivery_service.display_name,
      "tr_response_headers" => delivery_service.tr_response_headers,
      "initial_dispersion" => delivery_service.initial_dispersion,
      "dns_bypass_name" => delivery_service.dns_bypass_name,
      "tr_request_headers" => delivery_service.tr_request_headers}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, delivery_service_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, delivery_service_path(conn, :create), delivery_service: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(DeliveryService, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, delivery_service_path(conn, :create), delivery_service: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    delivery_service = Repo.insert! %DeliveryService{}
    conn = put conn, delivery_service_path(conn, :update, delivery_service), delivery_service: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(DeliveryService, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    delivery_service = Repo.insert! %DeliveryService{}
    conn = put conn, delivery_service_path(conn, :update, delivery_service), delivery_service: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    delivery_service = Repo.insert! %DeliveryService{}
    conn = delete conn, delivery_service_path(conn, :delete, delivery_service)
    assert response(conn, 204)
    refute Repo.get(DeliveryService, delivery_service.id)
  end
end
