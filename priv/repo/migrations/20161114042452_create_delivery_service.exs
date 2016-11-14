defmodule Tox.Repo.Migrations.CreateDeliveryService do
  use Ecto.Migration

  def change do
    create table(:deliveryservices) do
      add :xml_id, :string
      add :active, :boolean, default: false, null: false
      add :dscp, :integer
      add :signed, :boolean, default: false, null: false
      add :geo_limit, :boolean, default: false, null: false
      add :html_bypass_fqdn, :string
      add :dns_bypass_ip, :string
      add :dns_bypass_ip6, :string
      add :dns_bypass_ttl, :integer
      add :origin_fqdn, :string
      add :type, :integer
      add :profile, :integer
      add :cdn_id, :integer
      add :ccr_dns_ttl, :integer
      add :global_max_mbps, :integer
      add :global_max_tps, :integer
      add :long_description, :string
      add :max_dns_answers, :integer
      add :info_url, :string
      add :miss_latitude, :float
      add :miss_longitude, :float
      add :check_path, :string
      add :last_updated, :datetime
      add :protocol, :integer
      add :ssl_key_version, :integer
      add :ipv6_routing_enabled, :boolean, default: false, null: false
      add :range_request_handling, :integer
      add :edge_header_rewrite, :string
      add :origin_shield, :string
      add :mid_header_rewrite, :string
      add :regex_remap, :string
      add :cacheurl, :string
      add :remap_text, :string
      add :multi_site_origin, :boolean, default: false, null: false
      add :display_name, :string
      add :tr_response_headers, :string
      add :initial_dispersion, :integer
      add :dns_bypass_name, :string
      add :tr_request_headers, :string

      timestamps()
    end

  end
end
