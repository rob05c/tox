defmodule Tox.ServerController do
  use Tox.Web, :controller

  alias Tox.Server

  def index(conn, _params) do
    servers = Repo.all(Server)
    render(conn, "index.json", servers: servers)
  end

  def create(conn, %{"server" => server_params}) do
    changeset = Server.changeset(%Server{}, server_params)

    case Repo.insert(changeset) do
      {:ok, server} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", server_path(conn, :show, server))
        |> render("show.json", server: server)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    server = Repo.get!(Server, id)
    render(conn, "show.json", server: server)
  end

  def update(conn, %{"id" => id, "server" => server_params}) do
    server = Repo.get!(Server, id)
    changeset = Server.changeset(server, server_params)

    case Repo.update(changeset) do
      {:ok, server} ->
        render(conn, "show.json", server: server)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    server = Repo.get!(Server, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(server)

    send_resp(conn, :no_content, "")
  end
end
