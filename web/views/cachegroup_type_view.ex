defmodule Tox.CachegroupTypeView do
  use Tox.Web, :view

  def render("index.json", %{cachegroup_types: cachegroup_types}) do
    %{data: render_many(cachegroup_types, Tox.CachegroupTypeView, "cachegroup_type.json")}
  end

  def render("show.json", %{cachegroup_type: cachegroup_type}) do
    %{data: render_one(cachegroup_type, Tox.CachegroupTypeView, "cachegroup_type.json")}
  end

  def render("cachegroup_type.json", %{cachegroup_type: cachegroup_type}) do
    %{name: cachegroup_type.name,
      description: cachegroup_type.description}
  end
end
