defmodule Tox.Repo.Migrations.CreateServer do
  use Ecto.Migration

  def change do
    create table(:servers) do
      add :host_name, :string
      add :domain_name, :string
      add :tcp_port, :integer
      add :xmpp_id, :string
      add :xmpp_password, :string
      add :interface_name, :string
      add :ip_address, :string
      add :ip_netmask, :string
      add :ip_gateway, :string
      add :ip6_address, :string
      add :ip6_gateway, :string
      add :interface_mtu, :string
      add :physical_location, :integer
      add :rack, :string
      add :cachegroup, :integer
      add :type, :integer
      add :update_pending, :boolean, default: false, null: false
      add :profile, :integer
      add :cdn, :integer
      add :management_ip_address, :string
      add :management_ip_netmask, :string
      add :management_ip_gateway, :string
      add :ilo_ip_address, :string
      add :ilo_ip_netmask, :string
      add :ilo_ip_gateway, :string
      add :ilo_username, :string
      add :ilo_password, :string
      add :router_host_name, :string
      add :router_port_name, :string
      add :last_updated, :datetime

      timestamps()
    end

  end
end
