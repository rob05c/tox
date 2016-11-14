defmodule Tox.ServerTest do
  use Tox.ModelCase

  alias Tox.Server

  @valid_attrs %{cachegroup: 42, cdn: 42, domain_name: "some content", host_name: "some content", ilo_ip_address: "some content", ilo_ip_gateway: "some content", ilo_ip_netmask: "some content", ilo_password: "some content", ilo_username: "some content", interface_mtu: "some content", interface_name: "some content", ip6_address: "some content", ip6_gateway: "some content", ip_address: "some content", ip_gateway: "some content", ip_netmask: "some content", last_updated: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, management_ip_address: "some content", management_ip_gateway: "some content", management_ip_netmask: "some content", physical_location: 42, profile: 42, rack: "some content", router_host_name: "some content", router_port_name: "some content", tcp_port: 42, type: 42, update_pending: true, xmpp_id: "some content", xmpp_password: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Server.changeset(%Server{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Server.changeset(%Server{}, @invalid_attrs)
    refute changeset.valid?
  end
end
