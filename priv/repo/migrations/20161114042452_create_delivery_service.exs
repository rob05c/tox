defmodule Tox.Repo.Migrations.CreateDeliveryService do
  use Ecto.Migration

  def change do
    create table(:deliveryservices, primary_key: false) do
      add :xml_id, :text, primary_key: true
      add :active, :boolean, default: false, null: false
      add :dscp, :integer
      add :signed, :boolean, default: false, null: false
      add :geo_limit, :boolean, default: false, null: false
      add :html_bypass_fqdn, :text
      add :dns_bypass_ip, :text
      add :dns_bypass_ip6, :text
      add :dns_bypass_ttl, :integer
      add :origin_fqdn, :text
      add :type, references(:delivery_service_types, column: :name, type: :text)
      add :profile, :integer
      add :cdn_id, :integer
      add :ccr_dns_ttl, :integer
      add :global_max_mbps, :integer
      add :global_max_tps, :integer
      add :long_description, :text
      add :max_dns_answers, :integer
      add :info_url, :text
      add :miss_latitude, :float
      add :miss_longitude, :float
      add :check_path, :text
      add :last_updated, :datetime
      add :protocol, :integer
      add :ssl_key_version, :integer
      add :ipv6_routing_enabled, :boolean, default: false, null: false
      add :range_request_handling, :integer
      add :edge_header_rewrite, :text
      add :origin_shield, :text
      add :mid_header_rewrite, :text
      add :regex_remap, :text
      add :cacheurl, :text
      add :remap_text, :text
      add :multi_site_origin, :boolean, default: false, null: false
      add :display_name, :text
      add :tr_response_headers, :text
      add :initial_dispersion, :integer
      add :dns_bypass_name, :text
      add :tr_request_headers, :text

      timestamps()
    end

  end
end
