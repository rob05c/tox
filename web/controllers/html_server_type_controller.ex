defmodule Tox.HtmlServerTypeController do
  use Tox.Web, :controller

  alias Tox.ServerType

  def index(conn, _params) do
    server_types = Repo.all(ServerType)
    render(conn, "index.html", server_types: server_types)
  end

  def new(conn, _params) do
    changeset = ServerType.changeset(%ServerType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"server_type" => server_type_params}) do
    changeset = ServerType.changeset(%ServerType{}, server_type_params)

    case Repo.insert(changeset) do
      {:ok, _server_type} ->
        conn
        |> put_flash(:info, "Server type created successfully.")
        |> redirect(to: html_server_type_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    server_type = Repo.get!(ServerType, id)
    render(conn, "show.html", server_type: server_type)
  end

  def edit(conn, %{"id" => id}) do
    server_type = Repo.get!(ServerType, id)
    changeset = ServerType.changeset(server_type)
    render(conn, "edit.html", server_type: server_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "server_type" => server_type_params}) do
    server_type = Repo.get!(ServerType, id)
    changeset = ServerType.changeset(server_type, server_type_params)

    case Repo.update(changeset) do
      {:ok, server_type} ->
        conn
        |> put_flash(:info, "Server type updated successfully.")
        |> redirect(to: html_server_type_path(conn, :show, server_type))
      {:error, changeset} ->
        render(conn, "edit.html", server_type: server_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    server_type = Repo.get!(ServerType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(server_type)

    conn
    |> put_flash(:info, "Server type deleted successfully.")
    |> redirect(to: html_server_type_path(conn, :index))
  end
end
