defmodule Tox.CachegroupView do
  use Tox.Web, :view

  def render("index.json", %{cachegroups: cachegroups}) do
    %{data: render_many(cachegroups, Tox.CachegroupView, "cachegroup.json")}
  end

  def render("show.json", %{cachegroup: cachegroup}) do
    %{data: render_one(cachegroup, Tox.CachegroupView, "cachegroup.json")}
  end

  def render("cachegroup.json", %{cachegroup: cachegroup}) do
    %{name: cachegroup.name,
      short_name: cachegroup.short_name,
      latitude: cachegroup.latitude,
      longitude: cachegroup.longitude,
      parent: cachegroup.parent,
      secondary_parent: cachegroup.secondary_parent,
      type: cachegroup.type}
  end
end
