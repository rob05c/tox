defmodule Tox.ProfileParameterController do
  use Tox.Web, :controller

  alias Tox.ProfileParameter

  def index(conn, _params) do
    profileparameters = Repo.all(ProfileParameter)
    render(conn, "index.json", profileparameters: profileparameters)
  end

  def create(conn, %{"profile_parameter" => profile_parameter_params}) do
    changeset = ProfileParameter.changeset(%ProfileParameter{}, profile_parameter_params)

    case Repo.insert(changeset) do
      {:ok, profile_parameter} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", profile_parameter_path(conn, :show, profile_parameter))
        |> render("show.json", profile_parameter: profile_parameter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    profile_parameter = Repo.get!(ProfileParameter, id)
    render(conn, "show.json", profile_parameter: profile_parameter)
  end

  def update(conn, %{"id" => id, "profile_parameter" => profile_parameter_params}) do
    profile_parameter = Repo.get!(ProfileParameter, id)
    changeset = ProfileParameter.changeset(profile_parameter, profile_parameter_params)

    case Repo.update(changeset) do
      {:ok, profile_parameter} ->
        render(conn, "show.json", profile_parameter: profile_parameter)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile_parameter = Repo.get!(ProfileParameter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(profile_parameter)

    send_resp(conn, :no_content, "")
  end
end
