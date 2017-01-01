defmodule Tox.CachegroupParameterController do
  use Tox.Web, :controller

  alias Tox.CachegroupParameter

  def index(conn, _params) do
    cachegroupparameters = Repo.all(CachegroupParameter)
    render(conn, "index.json", cachegroupparameters: cachegroupparameters)
  end

  def create(conn, %{"cachegroup_parameter" => cachegroup_parameter_params}) do
    changeset = CachegroupParameter.changeset(%CachegroupParameter{}, cachegroup_parameter_params)

    case Repo.insert(changeset) do
      {:ok, cachegroup_parameter} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", cachegroup_parameter_path(conn, :show, cachegroup_parameter))
        |> render("show.json", cachegroup_parameter: cachegroup_parameter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cachegroup_parameter = Repo.get!(CachegroupParameter, id)
    render(conn, "show.json", cachegroup_parameter: cachegroup_parameter)
  end

  def update(conn, %{"id" => id, "cachegroup_parameter" => cachegroup_parameter_params}) do
    cachegroup_parameter = Repo.get!(CachegroupParameter, id)
    changeset = CachegroupParameter.changeset(cachegroup_parameter, cachegroup_parameter_params)

    case Repo.update(changeset) do
      {:ok, cachegroup_parameter} ->
        render(conn, "show.json", cachegroup_parameter: cachegroup_parameter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cachegroup_parameter = Repo.get!(CachegroupParameter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cachegroup_parameter)

    send_resp(conn, :no_content, "")
  end
end
