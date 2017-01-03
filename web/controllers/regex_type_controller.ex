defmodule Tox.RegexTypeController do
  use Tox.Web, :controller

  alias Tox.RegexType

  def index(conn, _params) do
    regex_types = Repo.all(RegexType)
    render(conn, "index.json", regex_types: regex_types)
  end

  def create(conn, %{"regex_type" => regex_type_params}) do
    changeset = RegexType.changeset(%RegexType{}, regex_type_params)

    case Repo.insert(changeset) do
      {:ok, regex_type} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", regex_type_path(conn, :show, regex_type))
        |> render("show.json", regex_type: regex_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    regex_type = Repo.get!(RegexType, id)
    render(conn, "show.json", regex_type: regex_type)
  end

  def update(conn, %{"id" => id, "regex_type" => regex_type_params}) do
    regex_type = Repo.get!(RegexType, id)
    changeset = RegexType.changeset(regex_type, regex_type_params)

    case Repo.update(changeset) do
      {:ok, regex_type} ->
        render(conn, "show.json", regex_type: regex_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    regex_type = Repo.get!(RegexType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(regex_type)

    send_resp(conn, :no_content, "")
  end
end
