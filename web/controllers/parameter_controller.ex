defmodule Tox.ParameterController do
  use Tox.Web, :controller

  alias Tox.Parameter

  def index(conn, _params) do
    parameters = Repo.all(Parameter)
    render(conn, "index.json", parameters: parameters)
  end

  def create(conn, %{"parameter" => parameter_params}) do
    changeset = Parameter.changeset(%Parameter{}, parameter_params)

    case Repo.insert(changeset) do
      {:ok, parameter} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", parameter_path(conn, :show, parameter))
        |> render("show.json", parameter: parameter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    parameter = Repo.get!(Parameter, id)
    render(conn, "show.json", parameter: parameter)
  end

  def update(conn, %{"id" => id, "parameter" => parameter_params}) do
    parameter = Repo.get!(Parameter, id)
    changeset = Parameter.changeset(parameter, parameter_params)

    case Repo.update(changeset) do
      {:ok, parameter} ->
        render(conn, "show.json", parameter: parameter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    parameter = Repo.get!(Parameter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(parameter)

    send_resp(conn, :no_content, "")
  end
end
