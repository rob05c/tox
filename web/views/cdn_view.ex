defmodule Tox.CdnView do
  use Tox.Web, :view

  def render("index.json", %{cdns: cdns}) do
    %{data: render_many(cdns, Tox.CdnView, "cdn.json")}
  end

  def render("show.json", %{cdn: cdn}) do
    %{data: render_one(cdn, Tox.CdnView, "cdn.json")}
  end

  def render("cdn.json", %{cdn: cdn}) do
    %{id: cdn.id,
      name: cdn.name,
      dnssec_enabled: cdn.dnssec_enabled}
  end
end
