defmodule Tox.HtmlCachegroupTypeController do
  use Tox.Web, :controller

  alias Tox.CachegroupType

  def index(conn, _params) do
    cachegroup_types = Repo.all(CachegroupType)
    render(conn, "index.html", cachegroup_types: cachegroup_types)
  end

  def new(conn, _params) do
    changeset = CachegroupType.changeset(%CachegroupType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cachegroup_type" => cachegroup_type_params}) do
    changeset = CachegroupType.changeset(%CachegroupType{}, cachegroup_type_params)

    case Repo.insert(changeset) do
      {:ok, _cachegroup_type} ->
        conn
        |> put_flash(:info, "Cachegroup type created successfully.")
        |> redirect(to: html_cachegroup_type_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cachegroup_type = Repo.get!(CachegroupType, id)
    render(conn, "show.html", cachegroup_type: cachegroup_type)
  end

  def edit(conn, %{"id" => id}) do
    cachegroup_type = Repo.get!(CachegroupType, id)
    changeset = CachegroupType.changeset(cachegroup_type)
    render(conn, "edit.html", cachegroup_type: cachegroup_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cachegroup_type" => cachegroup_type_params}) do
    cachegroup_type = Repo.get!(CachegroupType, id)
    changeset = CachegroupType.changeset(cachegroup_type, cachegroup_type_params)

    case Repo.update(changeset) do
      {:ok, cachegroup_type} ->
        conn
        |> put_flash(:info, "Cachegroup type updated successfully.")
        |> redirect(to: html_cachegroup_type_path(conn, :show, cachegroup_type))
      {:error, changeset} ->
        render(conn, "edit.html", cachegroup_type: cachegroup_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cachegroup_type = Repo.get!(CachegroupType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cachegroup_type)

    conn
    |> put_flash(:info, "Cachegroup type deleted successfully.")
    |> redirect(to: html_cachegroup_type_path(conn, :index))
  end
end
