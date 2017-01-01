defmodule Tox.HtmlCdnController do
  use Tox.Web, :controller

  alias Tox.Cdn

  def index(conn, _params) do
    cdns = Repo.all(Cdn)
    render(conn, "index.html", cdns: cdns)
  end

  def new(conn, _params) do
    changeset = Cdn.changeset(%Cdn{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cdn" => cdn_params}) do
    changeset = Cdn.changeset(%Cdn{}, cdn_params)

    case Repo.insert(changeset) do
      {:ok, _cdn} ->
        conn
        |> put_flash(:info, "CDN created successfully.")
        |> redirect(to: html_cdn_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cdn = Repo.get!(Cdn, id)
    render(conn, "show.html", cdn: cdn)
  end

  def edit(conn, %{"id" => id}) do
    cdn = Repo.get!(Cdn, id)
    changeset = Cdn.changeset(cdn)
    render(conn, "edit.html", cdn: cdn, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cdn" => cdn_params}) do
    cdn = Repo.get!(Cdn, id)
    changeset = Cdn.changeset(cdn, cdn_params)

    case Repo.update(changeset) do
      {:ok, cdn} ->
        conn
        |> put_flash(:info, "CDN updated successfully.")
        |> redirect(to: html_cdn_path(conn, :show, cdn))
      {:error, changeset} ->
        render(conn, "edit.html", cdn: cdn, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cdn = Repo.get!(Cdn, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cdn)

    conn
    |> put_flash(:info, "CDN deleted successfully.")
    |> redirect(to: html_cdn_path(conn, :index))
  end
end
