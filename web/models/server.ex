defmodule Tox.Server do
  use Tox.Web, :model

  schema "servers" do
    field :host_name, :string
    field :domain_name, :string
    field :tcp_port, :integer
    field :xmpp_id, :string
    field :xmpp_password, :string
    field :interface_name, :string
    field :ip_address, :string
    field :ip_netmask, :string
    field :ip_gateway, :string
    field :ip6_address, :string
    field :ip6_gateway, :string
    field :interface_mtu, :string
    field :physical_location, :integer
    field :rack, :string
    field :cachegroup, :integer
    field :type, :integer
    field :update_pending, :boolean, default: false
    field :profile, :integer
    field :cdn, :integer
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
    field :last_updated, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:host_name, :domain_name, :tcp_port, :xmpp_id, :xmpp_password, :interface_name, :ip_address, :ip_netmask, :ip_gateway, :ip6_address, :ip6_gateway, :interface_mtu, :physical_location, :rack, :cachegroup, :type, :update_pending, :profile, :cdn, :management_ip_address, :management_ip_netmask, :management_ip_gateway, :ilo_ip_address, :ilo_ip_netmask, :ilo_ip_gateway, :ilo_username, :ilo_password, :router_host_name, :router_port_name, :last_updated])
    |> validate_required([:host_name, :domain_name])
  end
end
