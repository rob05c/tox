defmodule Tox.PageController do
  use Tox.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
