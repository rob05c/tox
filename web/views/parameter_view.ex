defmodule Tox.ParameterView do
  use Tox.Web, :view

  def render("index.json", %{parameters: parameters}) do
    %{data: render_many(parameters, Tox.ParameterView, "parameter.json")}
  end

  def render("show.json", %{parameter: parameter}) do
    %{data: render_one(parameter, Tox.ParameterView, "parameter.json")}
  end

  def render("parameter.json", %{parameter: parameter}) do
    %{id: parameter.id,
      name: parameter.name,
      config_file: parameter.config_file,
      value: parameter.value,
      secure: parameter.secure}
  end
end
