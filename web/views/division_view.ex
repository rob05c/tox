defmodule Tox.DivisionView do
  use Tox.Web, :view

  def render("index.json", %{divisions: divisions}) do
    %{data: render_many(divisions, Tox.DivisionView, "division.json")}
  end

  def render("show.json", %{division: division}) do
    %{data: render_one(division, Tox.DivisionView, "division.json")}
  end

  def render("division.json", %{division: division}) do
    %{id: division.id,
      name: division.name}
  end
end
