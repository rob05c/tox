defmodule Tox.HtmlRegexTypeController do
  use Tox.Web, :controller

  alias Tox.RegexType

  def index(conn, _params) do
    regex_types = Repo.all(RegexType)
    render(conn, "index.html", regex_types: regex_types)
  end

  def new(conn, _params) do
    changeset = RegexType.changeset(%RegexType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"regex_type" => regex_type_params}) do
    changeset = RegexType.changeset(%RegexType{}, regex_type_params)

    case Repo.insert(changeset) do
      {:ok, _regex_type} ->
        conn
        |> put_flash(:info, "Regex type created successfully.")
        |> redirect(to: html_regex_type_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    regex_type = Repo.get!(RegexType, id)
    render(conn, "show.html", regex_type: regex_type)
  end

  def edit(conn, %{"id" => id}) do
    regex_type = Repo.get!(RegexType, id)
    changeset = RegexType.changeset(regex_type)
    render(conn, "edit.html", regex_type: regex_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "regex_type" => regex_type_params}) do
    regex_type = Repo.get!(RegexType, id)
    changeset = RegexType.changeset(regex_type, regex_type_params)

    case Repo.update(changeset) do
      {:ok, regex_type} ->
        conn
        |> put_flash(:info, "Regex type updated successfully.")
        |> redirect(to: html_regex_type_path(conn, :show, regex_type))
      {:error, changeset} ->
        render(conn, "edit.html", regex_type: regex_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    regex_type = Repo.get!(RegexType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(regex_type)

    conn
    |> put_flash(:info, "Regex type deleted successfully.")
    |> redirect(to: html_regex_type_path(conn, :index))
  end
end
