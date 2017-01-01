defmodule Tox.CachegroupController do
  use Tox.Web, :controller

  alias Tox.Cachegroup

  def index(conn, _params) do
    cachegroups = Repo.all(Cachegroup)
    render(conn, "index.json", cachegroups: cachegroups)
  end

  def create(conn, %{"cachegroup" => cachegroup_params}) do
    changeset = Cachegroup.changeset(%Cachegroup{}, cachegroup_params)

    case Repo.insert(changeset) do
      {:ok, cachegroup} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", cachegroup_path(conn, :show, cachegroup))
        |> render("show.json", cachegroup: cachegroup)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cachegroup = Repo.get!(Cachegroup, id)
    render(conn, "show.json", cachegroup: cachegroup)
  end

  def update(conn, %{"id" => id, "cachegroup" => cachegroup_params}) do
    cachegroup = Repo.get!(Cachegroup, id)
    changeset = Cachegroup.changeset(cachegroup, cachegroup_params)

    case Repo.update(changeset) do
      {:ok, cachegroup} ->
        render(conn, "show.json", cachegroup: cachegroup)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cachegroup = Repo.get!(Cachegroup, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cachegroup)

    send_resp(conn, :no_content, "")
  end
end
