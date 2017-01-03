defmodule Tox.Server do
  use Tox.Web, :model

  @primary_key false
  @derive {Phoenix.Param, key: :host}
  schema "servers" do
    field :host, :string, primary_key: true
    field :domain, :string
    field :port, :integer
    field :xmpp_id, :string
    field :xmpp_password, :string
    field :interface_name, :string
    field :ip_address, :string
    field :ip_netmask, :string
    field :ip_gateway, :string
    field :ip6_address, :string
    field :ip6_gateway, :string
    field :interface_mtu, :string
    field :physical_location, :string
    field :rack, :string
    field :cachegroup, :string
    field :type, :string
    field :update_pending, :boolean, default: false
    field :profile, :string
    field :cdn, :string
    field :management_ip_address, :string
    field :management_ip_netmask, :string
    field :management_ip_gateway, :string
    field :ilo_ip_address, :string
    field :ilo_ip_netmask, :string
    field :ilo_ip_gateway, :string
    field :ilo_username, :string
    field :ilo_password, :string
    field :router_host_name, :string
    field :router_port_name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:host, :domain, :port, :xmpp_id, :xmpp_password, :interface_name, :ip_address, :ip_netmask, :ip_gateway, :ip6_address, :ip6_gateway, :interface_mtu, :physical_location, :rack, :cachegroup, :type, :update_pending, :profile, :cdn, :management_ip_address, :management_ip_netmask, :management_ip_gateway, :ilo_ip_address, :ilo_ip_netmask, :ilo_ip_gateway, :ilo_username, :ilo_password, :router_host_name, :router_port_name])
    |> validate_required([:host, :domain, :port])
  end
end
