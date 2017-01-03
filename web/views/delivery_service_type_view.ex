defmodule Tox.DeliveryServiceTypeView do
  use Tox.Web, :view

  def render("index.json", %{delivery_service_types: delivery_service_types}) do
    %{data: render_many(delivery_service_types, Tox.DeliveryServiceTypeView, "delivery_service_type.json")}
  end

  def render("show.json", %{delivery_service_type: delivery_service_type}) do
    %{data: render_one(delivery_service_type, Tox.DeliveryServiceTypeView, "delivery_service_type.json")}
  end

  def render("delivery_service_type.json", %{delivery_service_type: delivery_service_type}) do
    %{name: delivery_service_type.name,
      description: delivery_service_type.description}
  end
end
