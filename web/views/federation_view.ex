defmodule Tox.FederationView do
  use Tox.Web, :view

  def render("index.json", %{federations: federations}) do
    %{data: render_many(federations, Tox.FederationView, "federation.json")}
  end

  def render("show.json", %{federation: federation}) do
    %{data: render_one(federation, Tox.FederationView, "federation.json")}
  end

  def render("federation.json", %{federation: federation}) do
    %{id: federation.id,
      cname: federation.cname,
      description: federation.description,
      ttl: federation.ttl}
  end
end
