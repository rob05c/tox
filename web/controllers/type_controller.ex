defmodule Tox.TypeController do
  use Tox.Web, :controller

  alias Tox.Type

  def index(conn, _params) do
    types = Repo.all(Type)
    render(conn, "index.json", types: types)
  end

  def create(conn, %{"type" => type_params}) do
    changeset = Type.changeset(%Type{}, type_params)

    case Repo.insert(changeset) do
      {:ok, type} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", type_path(conn, :show, type))
        |> render("show.json", type: type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    type = Repo.get!(Type, id)
    render(conn, "show.json", type: type)
  end

  def update(conn, %{"id" => id, "type" => type_params}) do
    type = Repo.get!(Type, id)
    changeset = Type.changeset(type, type_params)

    case Repo.update(changeset) do
      {:ok, type} ->
        render(conn, "show.json", type: type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    type = Repo.get!(Type, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(type)

    send_resp(conn, :no_content, "")
  end
end
