defmodule Tox.LogView do
  use Tox.Web, :view

  def render("index.json", %{logs: logs}) do
    %{data: render_many(logs, Tox.LogView, "log.json")}
  end

  def render("show.json", %{log: log}) do
    %{data: render_one(log, Tox.LogView, "log.json")}
  end

  def render("log.json", %{log: log}) do
    %{id: log.id,
      level: log.level,
      message: log.message,
      user: log.user,
      ticketnum: log.ticketnum}
  end
end
