defmodule Tox.RegexController do
  use Tox.Web, :controller

  alias Tox.Regex

  def index(conn, _params) do
    regexes = Repo.all(Regex)
    render(conn, "index.json", regexes: regexes)
  end

  def create(conn, %{"regex" => regex_params}) do
    changeset = Regex.changeset(%Regex{}, regex_params)

    case Repo.insert(changeset) do
      {:ok, regex} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", regex_path(conn, :show, regex))
        |> render("show.json", regex: regex)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    regex = Repo.get!(Regex, id)
    render(conn, "show.json", regex: regex)
  end

  def update(conn, %{"id" => id, "regex" => regex_params}) do
    regex = Repo.get!(Regex, id)
    changeset = Regex.changeset(regex, regex_params)

    case Repo.update(changeset) do
      {:ok, regex} ->
        render(conn, "show.json", regex: regex)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    regex = Repo.get!(Regex, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(regex)

    send_resp(conn, :no_content, "")
  end
end
