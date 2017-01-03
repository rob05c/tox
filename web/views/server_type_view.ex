defmodule Tox.ServerTypeView do
  use Tox.Web, :view

  def render("index.json", %{server_types: server_types}) do
    %{data: render_many(server_types, Tox.ServerTypeView, "server_type.json")}
  end

  def render("show.json", %{server_type: server_type}) do
    %{data: render_one(server_type, Tox.ServerTypeView, "server_type.json")}
  end

  def render("server_type.json", %{server_type: server_type}) do
    %{name: server_type.name,
      description: server_type.description}
  end
end
