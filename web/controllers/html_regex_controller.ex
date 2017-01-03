defmodule Tox.HtmlRegexController do
  use Tox.Web, :controller

  alias Tox.Regex

  def index(conn, _params) do
    regexs = Repo.all(Regex)
    render(conn, "index.html", regexs: regexs)
  end

  def new(conn, _params) do
    changeset = Regex.changeset(%Regex{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"regex" => regex_params}) do
    changeset = Regex.changeset(%Regex{}, regex_params)

    case Repo.insert(changeset) do
      {:ok, _regex} ->
        conn
        |> put_flash(:info, "Regex created successfully.")
        |> redirect(to: html_regex_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    regex = Repo.get!(Regex, id)
    render(conn, "show.html", regex: regex)
  end

  def edit(conn, %{"id" => id}) do
    regex = Repo.get!(Regex, id)
    changeset = Regex.changeset(regex)
    render(conn, "edit.html", regex: regex, changeset: changeset)
  end

  def update(conn, %{"id" => id, "regex" => regex_params}) do
    regex = Repo.get!(Regex, id)
    changeset = Regex.changeset(regex, regex_params)

    case Repo.update(changeset) do
      {:ok, regex} ->
        conn
        |> put_flash(:info, "Regex updated successfully.")
        |> redirect(to: html_regex_path(conn, :show, regex))
      {:error, changeset} ->
        render(conn, "edit.html", regex: regex, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    regex = Repo.get!(Regex, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(regex)

    conn
    |> put_flash(:info, "Regex deleted successfully.")
    |> redirect(to: html_regex_path(conn, :index))
  end
end
