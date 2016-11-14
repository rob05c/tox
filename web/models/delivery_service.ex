defmodule Tox.DeliveryService do
  use Tox.Web, :model

  schema "deliveryservices" do
    field :xml_id, :string
    field :active, :boolean, default: false
    field :dscp, :integer
    field :signed, :boolean, default: false
    field :geo_limit, :boolean, default: false
    field :html_bypass_fqdn, :string
    field :dns_bypass_ip, :string
    field :dns_bypass_ip6, :string
    field :dns_bypass_ttl, :integer
    field :origin_fqdn, :string
    field :type, :integer
    field :profile, :integer
    field :cdn_id, :integer
    field :ccr_dns_ttl, :integer
    field :global_max_mbps, :integer
    field :global_max_tps, :integer
    field :long_description, :string
    field :max_dns_answers, :integer
    field :info_url, :string
    field :miss_latitude, :float
    field :miss_longitude, :float
    field :check_path, :string
    field :last_updated, Ecto.DateTime
    field :protocol, :integer
    field :ssl_key_version, :integer
    field :ipv6_routing_enabled, :boolean, default: false
    field :range_request_handling, :integer
    field :edge_header_rewrite, :string
    field :origin_shield, :string
    field :mid_header_rewrite, :string
    field :regex_remap, :string
    field :cacheurl, :string
    field :remap_text, :string
    field :multi_site_origin, :boolean, default: false
    field :display_name, :string
    field :tr_response_headers, :string
    field :initial_dispersion, :integer
    field :dns_bypass_name, :string
    field :tr_request_headers, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:xml_id, :active, :dscp, :signed, :geo_limit, :html_bypass_fqdn, :dns_bypass_ip, :dns_bypass_ip6, :dns_bypass_ttl, :origin_fqdn, :type, :profile, :cdn_id, :ccr_dns_ttl, :global_max_mbps, :global_max_tps, :long_description, :max_dns_answers, :info_url, :miss_latitude, :miss_longitude, :check_path, :last_updated, :protocol, :ssl_key_version, :ipv6_routing_enabled, :range_request_handling, :edge_header_rewrite, :origin_shield, :mid_header_rewrite, :regex_remap, :cacheurl, :remap_text, :multi_site_origin, :display_name, :tr_response_headers, :initial_dispersion, :dns_bypass_name, :tr_request_headers])
    |> validate_required([:xml_id])
  end
end
