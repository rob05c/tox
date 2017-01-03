defmodule Tox.ServerTypeController do
  use Tox.Web, :controller

  alias Tox.ServerType

  def index(conn, _params) do
    server_types = Repo.all(ServerType)
    render(conn, "index.json", server_types: server_types)
  end

  def create(conn, %{"server_type" => server_type_params}) do
    changeset = ServerType.changeset(%ServerType{}, server_type_params)

    case Repo.insert(changeset) do
      {:ok, server_type} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", server_type_path(conn, :show, server_type))
        |> render("show.json", server_type: server_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    server_type = Repo.get!(ServerType, id)
    render(conn, "show.json", server_type: server_type)
  end

  def update(conn, %{"id" => id, "server_type" => server_type_params}) do
    server_type = Repo.get!(ServerType, id)
    changeset = ServerType.changeset(server_type, server_type_params)

    case Repo.update(changeset) do
      {:ok, server_type} ->
        render(conn, "show.json", server_type: server_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    server_type = Repo.get!(ServerType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(server_type)

    send_resp(conn, :no_content, "")
  end
end
