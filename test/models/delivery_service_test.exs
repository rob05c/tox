defmodule Tox.DeliveryServiceTest do
  use Tox.ModelCase

  alias Tox.DeliveryService

  @valid_attrs %{global_max_tps: 42, origin_fqdn: "some content", html_bypass_fqdn: "some content", origin_shield: "some content", miss_longitude: "120.5", edge_header_rewrite: "some content", initial_dispersion: 42, multi_site_origin: true, last_updated: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, dns_bypass_ip: "some content", display_name: "some content", ssl_key_version: 42, dns_bypass_name: "some content", type: 42, tr_request_headers: "some content", ccr_dns_ttl: 42, active: true, global_max_mbps: 42, protocol: 42, max_dns_answers: 42, range_request_handling: 42, check_path: "some content", dns_bypass_ttl: 42, ipv6_routing_enabled: true, remap_text: "some content", dns_bypass_ip6: "some content", long_description: "some content", geo_limit: true, xml_id: "some content", tr_response_headers: "some content", profile: 42, signed: true, regex_remap: "some content", dscp: 42, miss_latitude: "120.5", info_url: "some content", cacheurl: "some content", mid_header_rewrite: "some content", cdn_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = DeliveryService.changeset(%DeliveryService{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = DeliveryService.changeset(%DeliveryService{}, @invalid_attrs)
    refute changeset.valid?
  end
end
