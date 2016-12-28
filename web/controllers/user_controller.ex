defmodule Tox.UserController do
  use Tox.Web, :controller
  alias Tox.User
  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end
end
