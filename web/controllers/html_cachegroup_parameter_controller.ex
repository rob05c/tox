defmodule Tox.HtmlCachegroupParameterController do
  use Tox.Web, :controller

  alias Tox.CachegroupParameter

  def index(conn, _params) do
    cachegroupparameters = Repo.all(CachegroupParameter)
    render(conn, "index.html", cachegroupparameters: cachegroupparameters)
  end

  def new(conn, _params) do
    changeset = CachegroupParameter.changeset(%CachegroupParameter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cachegroup_parameter" => cachegroup_parameter_params}) do
    changeset = CachegroupParameter.changeset(%CachegroupParameter{}, cachegroup_parameter_params)

    case Repo.insert(changeset) do
      {:ok, _cachegroup_parameter} ->
        conn
        |> put_flash(:info, "Cachegroup parameter created successfully.")
        |> redirect(to: html_cachegroup_parameter_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cachegroup_parameter = Repo.get!(CachegroupParameter, id)
    render(conn, "show.html", cachegroup_parameter: cachegroup_parameter)
  end

  def edit(conn, %{"id" => id}) do
    cachegroup_parameter = Repo.get!(CachegroupParameter, id)
    changeset = CachegroupParameter.changeset(cachegroup_parameter)
    render(conn, "edit.html", cachegroup_parameter: cachegroup_parameter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cachegroup_parameter" => cachegroup_parameter_params}) do
    cachegroup_parameter = Repo.get!(CachegroupParameter, id)
    changeset = CachegroupParameter.changeset(cachegroup_parameter, cachegroup_parameter_params)

    case Repo.update(changeset) do
      {:ok, cachegroup_parameter} ->
        conn
        |> put_flash(:info, "Cachegroup parameter updated successfully.")
        |> redirect(to: html_cachegroup_parameter_path(conn, :show, cachegroup_parameter))
      {:error, changeset} ->
        render(conn, "edit.html", cachegroup_parameter: cachegroup_parameter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cachegroup_parameter = Repo.get!(CachegroupParameter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cachegroup_parameter)

    conn
    |> put_flash(:info, "Cachegroup parameter deleted successfully.")
    |> redirect(to: html_cachegroup_parameter_path(conn, :index))
  end
end
