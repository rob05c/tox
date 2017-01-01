# Tox

Experimental Traffic Ops rewrite in Elixir Phoenix

This project is a derivative work of Apache Traffic Control, which is Licensed under the Apache License, Version 2.0. See https://github.com/apache/incubator-trafficcontrol

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Creation

To re-create this experiment, install Phoenix and create a new project, then follow the Adding Models instructions.

`wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb`

`sudo apt-get update`

`sudo apt-get install esl-erlang`

`sudo apt-get install elixir`

`mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez`

`mix local.hex`

`mix deps.get`

`mix ecto.create && mix ecto.migrate`

`mix phoenix.server`

## Adding Models

We typically want both HTML and JSON endpoints for any new model (SQL table). Phoenix' generators don't directly support this, so we have to modify the generated files a bit.

Following are the commands which were run to generate JSON and HTML, and the necessary modifications.

### Server

```mix phoenix.gen.json Server servers host_name:string domain_name:string tcp_port:integer xmpp_id:string xmpp_password:string interface_name:string ip_address:string ip_netmask:string ip_gateway:string ip6_address:string ip6_gateway:string interface_mtu:string physical_location:integer rack:string cachegroup:integer type:integer update_pending:boolean profile:integer cdn:integer management_ip_address:string management_ip_netmask:string management_ip_gateway:string ilo_ip_address:string ilo_ip_netmask:string ilo_ip_gateway:string ilo_username:string ilo_password:string router_host_name:string router_port_name:string last_updated:datetime```

`mix ecto.migrate`

* add `resources "/servers", ServerController, except: [:new, :edit]` under `scope "/api", Tox do` in `web/router.ex`

```mix phoenix.gen.html --no-model HtmlServer servers host_name:string domain_name:string tcp_port:integer xmpp_id:string xmpp_password:string interface_name:string ip_address:string ip_netmask:string ip_gateway:string ip6_address:string ip6_gateway:string interface_mtu:string physical_location:integer rack:string cachegroup:integer type:integer update_pending:boolean profile:integer cdn:integer management_ip_address:string management_ip_netmask:string management_ip_gateway:string ilo_ip_address:string ilo_ip_netmask:string ilo_ip_gateway:string ilo_username:string ilo_password:string router_host_name:string router_port_name:string last_updated:datetime```

* In `html_server_controller.ex` replace:
  * all `HtmlServer` with `Tox.Server`
  * `"Html server` with `"Server`
  * `def create(conn, %{"html_server" => html_server_params})` with `def create(conn, %{"server" => html_server_params})`

* add `resources "/servers", HtmlServerController` under `scope "/", Tox do` in `web/router.ex`

* in `model/server.ex` in `|> validate_required([...` remove optional columns

#### Testing

`curl -LV -d '{"server":{"host_name":"foo", "domain_name":"example.net"}}' -H "Content-Type: application/json" -X POST http://localhost:4000/api/servers`

`curl localhost:4000/api/servers?format=json`

`curl -H "Content-Type: application/json" localhost:4000/api/servers`


### Delivery Service

```mix phoenix.gen.json DeliveryService deliveryservices xml_id:string active:boolean dscp:integer signed:boolean geo_limit:boolean html_bypass_fqdn:string dns_bypass_ip:string dns_bypass_ip6:string dns_bypass_ttl:integer origin_fqdn:string type:integer profile:integer cdn_id:integer ccr_dns_ttl:integer global_max_mbps:integer global_max_tps:integer long_description:string max_dns_answers:integer info_url:string miss_latitude:float miss_longitude:float check_path:string last_updated:datetime protocol:integer ssl_key_version:integer ipv6_routing_enabled:boolean range_request_handling:integer edge_header_rewrite:string origin_shield:string mid_header_rewrite:string regex_remap:string cacheurl:string remap_text:string multi_site_origin:boolean display_name:string tr_response_headers:string initial_dispersion:integer dns_bypass_name:string tr_request_headers:string```

* add `resources "/deliveryservices", DeliveryServiceController, except: [:new, :edit]` under `scope "/api", Tox do` in `web/router.ex`

`mix ecto.migrate`

```mix phoenix.gen.html --no-model HtmlDeliveryService deliveryservices xml_id:string active:boolean dscp:integer signed:boolean geo_limit:boolean html_bypass_fqdn:string dns_bypass_ip:string dns_bypass_ip6:string dns_bypass_ttl:integer origin_fqdn:string type:integer profile:integer cdn_id:integer ccr_dns_ttl:integer global_max_mbps:integer global_max_tps:integer long_description:string max_dns_answers:integer info_url:string miss_latitude:float miss_longitude:float check_path:string last_updated:datetime protocol:integer ssl_key_version:integer ipv6_routing_enabled:boolean range_request_handling:integer edge_header_rewrite:string origin_shield:string mid_header_rewrite:string regex_remap:string cacheurl:string remap_text:string multi_site_origin:boolean display_name:string tr_response_headers:string initial_dispersion:integer dns_bypass_name:string tr_request_headers:string```

* in `html_delivery_service_controller.ex` replace:
  * all `HtmlDeliveryService` with `Tox.DeliveryService`
  * `"Html delivery service` with `"Delivery service`
  * `def create(conn, %{"html_delivery_service" => html_delivery_service_params})` with `def create(conn, %{"delivery_service" => html_delivery_service_params})`

* in `model/delivery_service.ex` in `|> validate_required([...` remove optional columns

### Other tables

Follow the above instructions for the rest of the Traffic Ops tables:

`mix phoenix.gen.json Asn asns asn:int cachegroup:int`
`mix phoenix.gen.html --no-model HtmlAsn asns asn:integer cachegroup:integer`

`mix phoenix.gen.json Cachegroup cachegroups name:string short_name:string latitude:float longitude:float parent_cachegroup_id:integer secondary_parent_cachegroup_id:integer type:integer`

`mix phoenix.gen.html HtmlCachegroup cachegroups name:string short_name:string latitude:float longitude:float parent_cachegroup_id:integer secondary_parent_cachegroup_id:integer type:integer`

`mix phoenix.gen.json CachegroupParameter cachegroupparameters cachegroup:integer parameter:integer`
`mix phoenix.gen.html --no-model HtmlCachegroupParameter cachegroupparameters cachegroup:integer parameter:integer`

`mix phoenix.gen.json Cdn cdns name:string dnssec_enabled:boolean`
`mix phoenix.gen.html --no-model HtmlCdn cdns name:string dnssec_enabled:boolean`

`mix phoenix.gen.json DeliveryserviceRegex deliveryserviceregexes deliveryservice:integer regex:integer set_number:integer`
`mix phoenix.gen.html --no-model HtmlDeliveryserviceRegex deliveryserviceregexes deliveryservice:integer regex:integer set_number:integer`

`mix phoenix.gen.json DeliveryserviceServer deliveryserviceservers deliveryservice:integer server:integer`
`mix phoenix.gen.html --no-model HtmlDeliveryserviceServer deliveryserviceservers deliveryservice:integer server:integer`

`mix phoenix.gen.json Division divisions name:string`
`mix phoenix.gen.html --no-model HtmlDivision divisions name:string`

`mix phoenix.gen.json Federation federations cname:string description:string ttl:string`
`mix phoenix.gen.html --no-model HtmlFederation federations cname:string description:string ttl:string`

#### Testing

`curl -Lv -d '{"delivery_service":{"xml_id":"zwei", "active":true, "html_bypass_fqdn":"zwei.example.net"}}' -H "Content-Type: application/json" -X POST http://localhost:4000/api/deliveryservices`

`curl localhost:4000/api/deliveryservices?format=json`

`curl -H "Content-Type: application/json" localhost:4000/api/deliveryservices`

### Auth

`mix phoenix.gen.model User users email:string password_hash:string`

`mix ecto.migrate`

* in `/web/models/user.ex` add `field :password, :string, virtual: true` to `schema “users” do`

