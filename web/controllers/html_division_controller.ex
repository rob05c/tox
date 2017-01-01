defmodule Tox.HtmlDivisionController do
  use Tox.Web, :controller

  alias Tox.Division

  def index(conn, _params) do
    divisions = Repo.all(Division)
    render(conn, "index.html", divisions: divisions)
  end

  def new(conn, _params) do
    changeset = Division.changeset(%Division{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"division" => division_params}) do
    changeset = Division.changeset(%Division{}, division_params)

    case Repo.insert(changeset) do
      {:ok, _division} ->
        conn
        |> put_flash(:info, "Division created successfully.")
        |> redirect(to: html_division_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    division = Repo.get!(Division, id)
    render(conn, "show.html", division: division)
  end

  def edit(conn, %{"id" => id}) do
    division = Repo.get!(Division, id)
    changeset = Division.changeset(division)
    render(conn, "edit.html", division: division, changeset: changeset)
  end

  def update(conn, %{"id" => id, "division" => division_params}) do
    division = Repo.get!(Division, id)
    changeset = Division.changeset(division, division_params)

    case Repo.update(changeset) do
      {:ok, division} ->
        conn
        |> put_flash(:info, "Division updated successfully.")
        |> redirect(to: html_division_path(conn, :show, division))
      {:error, changeset} ->
        render(conn, "edit.html", division: division, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    division = Repo.get!(Division, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(division)

    conn
    |> put_flash(:info, "Division deleted successfully.")
    |> redirect(to: html_division_path(conn, :index))
  end
end
