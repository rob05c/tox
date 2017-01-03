defmodule Tox.DeliveryserviceServerView do
  use Tox.Web, :view

  def render("index.json", %{deliveryserviceservers: deliveryserviceservers}) do
    %{data: render_many(deliveryserviceservers, Tox.DeliveryserviceServerView, "deliveryservice_server.json")}
  end

  def render("show.json", %{deliveryservice_server: deliveryservice_server}) do
    %{data: render_one(deliveryservice_server, Tox.DeliveryserviceServerView, "deliveryservice_server.json")}
  end

  def render("deliveryservice_server.json", %{deliveryservice_server: deliveryservice_server}) do
    %{id: deliveryservice_server.id,
      deliveryservice: deliveryservice_server.deliveryservice,
      server_host: deliveryservice_server.server_host}
  end
end
