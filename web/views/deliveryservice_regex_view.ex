defmodule Tox.DeliveryserviceRegexView do
  use Tox.Web, :view

  def render("index.json", %{deliveryserviceregexes: deliveryserviceregexes}) do
    %{data: render_many(deliveryserviceregexes, Tox.DeliveryserviceRegexView, "deliveryservice_regex.json")}
  end

  def render("show.json", %{deliveryservice_regex: deliveryservice_regex}) do
    %{data: render_one(deliveryservice_regex, Tox.DeliveryserviceRegexView, "deliveryservice_regex.json")}
  end

  def render("deliveryservice_regex.json", %{deliveryservice_regex: deliveryservice_regex}) do
    %{id: deliveryservice_regex.id,
      deliveryservice: deliveryservice_regex.deliveryservice,
      regex: deliveryservice_regex.regex,
      set_number: deliveryservice_regex.set_number}
  end
end
