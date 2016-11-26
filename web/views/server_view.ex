defmodule Tox.ServerView do
  use Tox.Web, :view

  def render("index.json", %{servers: servers}) do
    %{response: render_many(servers, Tox.ServerView, "server.json")}
  end

  def render("show.json", %{server: server}) do
    %{response: render_one(server, Tox.ServerView, "server.json")}
  end

  def render("server.json", %{server: server}) do
    %{hostName: server.host_name,
      domain_name: server.domain_name,
      tcp_port: server.tcp_port,
      interface_name: server.interface_name,
      interface_mtu: server.interface_mtu,
      ip_address: server.ip_address,
      ip_gateway: server.ip_gateway,
      ip6_address: server.ip6_address,
      ip6_gateway: server.ip6_gateway,
      physical_location: server.physical_location,
      rack: server.rack,
      cachegroup: server.cachegroup,
      type: server.type,
      update_pending: server.update_pending,
      profile: server.profile,
      cdn: server.cdn,
      ilo_ip_address: server.ilo_ip_address,
      ilo_ip_gateway: server.ilo_ip_gateway,
      ilo_username: server.ilo_username,
      ilo_password: server.ilo_password,
      xmpp_id: server.xmpp_id,
      xmpp_password: server.xmpp_password,
      management_ip_address: server.management_ip_address,
      management_ip_gateway: server.management_ip_gateway,
      router_host_name: server.router_host_name,
      router_port_name: server.router_port_name}
  end
end


