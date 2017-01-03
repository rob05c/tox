defmodule Tox.RegexTypeView do
  use Tox.Web, :view

  def render("index.json", %{regex_types: regex_types}) do
    %{data: render_many(regex_types, Tox.RegexTypeView, "regex_type.json")}
  end

  def render("show.json", %{regex_type: regex_type}) do
    %{data: render_one(regex_type, Tox.RegexTypeView, "regex_type.json")}
  end

  def render("regex_type.json", %{regex_type: regex_type}) do
    %{name: regex_type.name,
      description: regex_type.description}
  end
end
