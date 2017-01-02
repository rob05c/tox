defmodule Tox.HtmlProfileParameterController do
  use Tox.Web, :controller

  alias Tox.ProfileParameter

  def index(conn, _params) do
    profileparameters = Repo.all(ProfileParameter)
    render(conn, "index.html", profileparameters: profileparameters)
  end

  def new(conn, _params) do
    changeset = ProfileParameter.changeset(%ProfileParameter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"profile_parameter" => profile_parameter_params}) do
    changeset = ProfileParameter.changeset(%ProfileParameter{}, profile_parameter_params)

    case Repo.insert(changeset) do
      {:ok, _profile_parameter} ->
        conn
        |> put_flash(:info, "Profile parameter created successfully.")
        |> redirect(to: html_profile_parameter_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    profile_parameter = Repo.get!(ProfileParameter, id)
    render(conn, "show.html", profile_parameter: profile_parameter)
  end

  def edit(conn, %{"id" => id}) do
    profile_parameter = Repo.get!(ProfileParameter, id)
    changeset = ProfileParameter.changeset(profile_parameter)
    render(conn, "edit.html", profile_parameter: profile_parameter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "profile_parameter" => profile_parameter_params}) do
    profile_parameter = Repo.get!(ProfileParameter, id)
    changeset = ProfileParameter.changeset(profile_parameter, profile_parameter_params)

    case Repo.update(changeset) do
      {:ok, profile_parameter} ->
        conn
        |> put_flash(:info, "Profile parameter updated successfully.")
        |> redirect(to: html_profile_parameter_path(conn, :show, profile_parameter))
      {:error, changeset} ->
        render(conn, "edit.html", profile_parameter: profile_parameter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile_parameter = Repo.get!(ProfileParameter, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(profile_parameter)

    conn
    |> put_flash(:info, "Profile parameter deleted successfully.")
    |> redirect(to: html_profile_parameter_path(conn, :index))
  end
end
