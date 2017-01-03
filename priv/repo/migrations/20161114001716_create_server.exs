defmodule Tox.Repo.Migrations.CreateServer do
  use Ecto.Migration

  def change do
    create table(:servers, primary_key: false) do
      add :host, :text, primary_key: true
      add :domain, :text
      add :port, :integer
      add :xmpp_id, :text
      add :xmpp_password, :text
      add :interface_name, :text
      add :ip_address, :text
      add :ip_netmask, :text
      add :ip_gateway, :text
      add :ip6_address, :text
      add :ip6_gateway, :text
      add :interface_mtu, :text
      add :physical_location, references(:physicallocations, column: :name, type: :text)
      add :rack, :text
      add :cachegroup, references(:cachegroups, column: :name, type: :text)
      add :type, references(:server_types, column: :name, type: :text)
      add :update_pending, :boolean, default: false, null: false
      add :profile, references(:profiles, column: :name, type: :text)
      add :cdn, references(:cdns, column: :name, type: :text)
      add :management_ip_address, :text
      add :management_ip_netmask, :text
      add :management_ip_gateway, :text
      add :ilo_ip_address, :text
      add :ilo_ip_netmask, :text
      add :ilo_ip_gateway, :text
      add :ilo_username, :text
      add :ilo_password, :text
      add :router_host_name, :text
      add :router_port_name, :text

      timestamps()
    end

  end
end
