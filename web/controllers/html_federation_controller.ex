defmodule Tox.HtmlFederationController do
  use Tox.Web, :controller

  alias Tox.Federation

  def index(conn, _params) do
    federations = Repo.all(Federation)
    render(conn, "index.html", federations: federations)
  end

  def new(conn, _params) do
    changeset = Federation.changeset(%Federation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"federation" => federation_params}) do
    changeset = Federation.changeset(%Federation{}, federation_params)

    case Repo.insert(changeset) do
      {:ok, _federation} ->
        conn
        |> put_flash(:info, "Federation created successfully.")
        |> redirect(to: html_federation_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    federation = Repo.get!(Federation, id)
    render(conn, "show.html", federation: federation)
  end

  def edit(conn, %{"id" => id}) do
    federation = Repo.get!(Federation, id)
    changeset = Federation.changeset(federation)
    render(conn, "edit.html", federation: federation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "federation" => federation_params}) do
    federation = Repo.get!(Federation, id)
    changeset = Federation.changeset(federation, federation_params)

    case Repo.update(changeset) do
      {:ok, federation} ->
        conn
        |> put_flash(:info, "Federation updated successfully.")
        |> redirect(to: html_federation_path(conn, :show, federation))
      {:error, changeset} ->
        render(conn, "edit.html", federation: federation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    federation = Repo.get!(Federation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(federation)

    conn
    |> put_flash(:info, "Federation deleted successfully.")
    |> redirect(to: html_federation_path(conn, :index))
  end
end
