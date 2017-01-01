defmodule Tox.CachegroupView do
  use Tox.Web, :view

  def render("index.json", %{cachegroups: cachegroups}) do
    %{data: render_many(cachegroups, Tox.CachegroupView, "cachegroup.json")}
  end

  def render("show.json", %{cachegroup: cachegroup}) do
    %{data: render_one(cachegroup, Tox.CachegroupView, "cachegroup.json")}
  end

  def render("cachegroup.json", %{cachegroup: cachegroup}) do
    %{id: cachegroup.id,
      name: cachegroup.name,
      short_name: cachegroup.short_name,
      latitude: cachegroup.latitude,
      longitude: cachegroup.longitude,
      parent_cachegroup_id: cachegroup.parent_cachegroup_id,
      secondary_parent_cachegroup_id: cachegroup.secondary_parent_cachegroup_id,
      type: cachegroup.type}
  end
end
