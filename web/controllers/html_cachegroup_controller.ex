defmodule Tox.HtmlCachegroupController do
  use Tox.Web, :controller

  alias Tox.Cachegroup

  def index(conn, _params) do
    cachegroups = Repo.all(Cachegroup)
    render(conn, "index.html", cachegroups: cachegroups)
  end

  def new(conn, _params) do
    changeset = Cachegroup.changeset(%Cachegroup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cachegroup" => cachegroup_params}) do
    changeset = Cachegroup.changeset(%Cachegroup{}, cachegroup_params)

    case Repo.insert(changeset) do
      {:ok, _cachegroup} ->
        conn
        |> put_flash(:info, "Cachegroup created successfully.")
        |> redirect(to: html_cachegroup_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cachegroup = Repo.get!(Cachegroup, id)
    render(conn, "show.html", cachegroup: cachegroup)
  end

  def edit(conn, %{"id" => id}) do
    cachegroup = Repo.get!(Cachegroup, id)
    changeset = Cachegroup.changeset(cachegroup)
    render(conn, "edit.html", cachegroup: cachegroup, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cachegroup" => cachegroup_params}) do
    cachegroup = Repo.get!(Cachegroup, id)
    changeset = Cachegroup.changeset(cachegroup, cachegroup_params)

    case Repo.update(changeset) do
      {:ok, cachegroup} ->
        conn
        |> put_flash(:info, "Cachegroup updated successfully.")
        |> redirect(to: html_cachegroup_path(conn, :show, cachegroup))
      {:error, changeset} ->
        render(conn, "edit.html", cachegroup: cachegroup, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cachegroup = Repo.get!(Cachegroup, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cachegroup)

    conn
    |> put_flash(:info, "Cachegroup deleted successfully.")
    |> redirect(to: html_cachegroup_path(conn, :index))
  end
end
