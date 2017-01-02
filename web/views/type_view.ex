defmodule Tox.TypeView do
  use Tox.Web, :view

  def render("index.json", %{types: types}) do
    %{data: render_many(types, Tox.TypeView, "type.json")}
  end

  def render("show.json", %{type: type}) do
    %{data: render_one(type, Tox.TypeView, "type.json")}
  end

  def render("type.json", %{type: type}) do
    %{id: type.id,
      name: type.name,
      description: type.description,
      use_in_table: type.use_in_table}
  end
end
