defmodule Tox.RegionView do
  use Tox.Web, :view

  def render("index.json", %{regions: regions}) do
    %{data: render_many(regions, Tox.RegionView, "region.json")}
  end

  def render("show.json", %{region: region}) do
    %{data: render_one(region, Tox.RegionView, "region.json")}
  end

  def render("region.json", %{region: region}) do
    %{name: region.name,
      division: region.division}
  end
end
