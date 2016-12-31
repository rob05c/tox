defmodule Tox.DeliveryServiceView do
  use Tox.Web, :view

  def render("index.json", %{deliveryservices: deliveryservices}) do
    %{data: render_many(deliveryservices, Tox.DeliveryServiceView, "delivery_service.json")}
  end

  def render("show.json", %{delivery_service: delivery_service}) do
    %{data: render_one(delivery_service, Tox.DeliveryServiceView, "delivery_service.json")}
  end

  def render("delivery_service.json", %{delivery_service: delivery_service}) do
    %{id: delivery_service.id,
      xml_id: delivery_service.xml_id,
      active: delivery_service.active,
      dscp: delivery_service.dscp,
      signed: delivery_service.signed,
      geo_limit: delivery_service.geo_limit,
      html_bypass_fqdn: delivery_service.html_bypass_fqdn,
      dns_bypass_ip: delivery_service.dns_bypass_ip,
      dns_bypass_ip6: delivery_service.dns_bypass_ip6,
      dns_bypass_ttl: delivery_service.dns_bypass_ttl,
      origin_fqdn: delivery_service.origin_fqdn,
      type: delivery_service.type,
      profile: delivery_service.profile,
      cdn_id: delivery_service.cdn_id,
      ccr_dns_ttl: delivery_service.ccr_dns_ttl,
      global_max_mbps: delivery_service.global_max_mbps,
      global_max_tps: delivery_service.global_max_tps,
      long_description: delivery_service.long_description,
      max_dns_answers: delivery_service.max_dns_answers,
      info_url: delivery_service.info_url,
      miss_latitude: delivery_service.miss_latitude,
      miss_longitude: delivery_service.miss_longitude,
      check_path: delivery_service.check_path,
      last_updated: delivery_service.last_updated,
      protocol: delivery_service.protocol,
      ssl_key_version: delivery_service.ssl_key_version,
      ipv6_routing_enabled: delivery_service.ipv6_routing_enabled,
      range_request_handling: delivery_service.range_request_handling,
      edge_header_rewrite: delivery_service.edge_header_rewrite,
      origin_shield: delivery_service.origin_shield,
      mid_header_rewrite: delivery_service.mid_header_rewrite,
      regex_remap: delivery_service.regex_remap,
      cacheurl: delivery_service.cacheurl,
      remap_text: delivery_service.remap_text,
      multi_site_origin: delivery_service.multi_site_origin,
      display_name: delivery_service.display_name,
      tr_response_headers: delivery_service.tr_response_headers,
      initial_dispersion: delivery_service.initial_dispersion,
      dns_bypass_name: delivery_service.dns_bypass_name,
      tr_request_headers: delivery_service.tr_request_headers,
      tenant: delivery_service.tenant}
  end
end
