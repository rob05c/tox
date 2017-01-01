defmodule Tox.CachegroupParameterView do
  use Tox.Web, :view

  def render("index.json", %{cachegroupparameters: cachegroupparameters}) do
    %{data: render_many(cachegroupparameters, Tox.CachegroupParameterView, "cachegroup_parameter.json")}
  end

  def render("show.json", %{cachegroup_parameter: cachegroup_parameter}) do
    %{data: render_one(cachegroup_parameter, Tox.CachegroupParameterView, "cachegroup_parameter.json")}
  end

  def render("cachegroup_parameter.json", %{cachegroup_parameter: cachegroup_parameter}) do
    %{id: cachegroup_parameter.id,
      cachegroup: cachegroup_parameter.cachegroup,
      parameter: cachegroup_parameter.parameter}
  end
end
