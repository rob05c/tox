defmodule Tox.HtmlServerController do
  use Tox.Web, :controller

  alias Tox.HtmlServer

  def index(conn, _params) do
    servers = Repo.all(Tox.Server)
    render(conn, "index.html", servers: servers)
  end

  def new(conn, _params) do
    changeset = Tox.Server.changeset(%Tox.Server{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"server" => html_server_params}) do
    changeset = Tox.Server.changeset(%Tox.Server{}, html_server_params)

    case Repo.insert(changeset) do
      {:ok, _html_server} ->
        conn
        |> put_flash(:info, "Server created successfully.")
        |> redirect(to: html_server_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    html_server = Repo.get!(Tox.Server, id)
    render(conn, "show.html", html_server: html_server)
  end

  def edit(conn, %{"id" => id}) do
    html_server = Repo.get!(Tox.Server, id)
    changeset = Tox.Server.changeset(html_server)
    render(conn, "edit.html", html_server: html_server, changeset: changeset)
  end

  def update(conn, %{"id" => id, "html_server" => html_server_params}) do
    html_server = Repo.get!(Tox.Server, id)
    changeset = Tox.Server.changeset(html_server, html_server_params)

    case Repo.update(changeset) do
      {:ok, html_server} ->
        conn
        |> put_flash(:info, "Server updated successfully.")
        |> redirect(to: html_server_path(conn, :show, html_server))
      {:error, changeset} ->
        render(conn, "edit.html", html_server: html_server, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    html_server = Repo.get!(Tox.Server, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(html_server)

    conn
    |> put_flash(:info, "Server deleted successfully.")
    |> redirect(to: html_server_path(conn, :index))
  end
end
