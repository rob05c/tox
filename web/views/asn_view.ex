defmodule Tox.AsnView do
  use Tox.Web, :view

  def render("index.json", %{asns: asns}) do
    %{data: render_many(asns, Tox.AsnView, "asn.json")}
  end

  def render("show.json", %{asn: asn}) do
    %{data: render_one(asn, Tox.AsnView, "asn.json")}
  end

  def render("asn.json", %{asn: asn}) do
    %{id: asn.id,
      asn: asn.asn,
      cachegroup: asn.cachegroup}
  end
end
