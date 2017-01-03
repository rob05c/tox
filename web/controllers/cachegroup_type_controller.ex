defmodule Tox.CachegroupTypeController do
  use Tox.Web, :controller

  alias Tox.CachegroupType

  def index(conn, _params) do
    cachegroup_types = Repo.all(CachegroupType)
    render(conn, "index.json", cachegroup_types: cachegroup_types)
  end

  def create(conn, %{"cachegroup_type" => cachegroup_type_params}) do
    changeset = CachegroupType.changeset(%CachegroupType{}, cachegroup_type_params)

    case Repo.insert(changeset) do
      {:ok, cachegroup_type} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", cachegroup_type_path(conn, :show, cachegroup_type))
        |> render("show.json", cachegroup_type: cachegroup_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cachegroup_type = Repo.get!(CachegroupType, id)
    render(conn, "show.json", cachegroup_type: cachegroup_type)
  end

  def update(conn, %{"id" => id, "cachegroup_type" => cachegroup_type_params}) do
    cachegroup_type = Repo.get!(CachegroupType, id)
    changeset = CachegroupType.changeset(cachegroup_type, cachegroup_type_params)

    case Repo.update(changeset) do
      {:ok, cachegroup_type} ->
        render(conn, "show.json", cachegroup_type: cachegroup_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cachegroup_type = Repo.get!(CachegroupType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cachegroup_type)

    send_resp(conn, :no_content, "")
  end
end
