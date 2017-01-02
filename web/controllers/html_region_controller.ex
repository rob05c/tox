defmodule Tox.HtmlRegionController do
  use Tox.Web, :controller

  alias Tox.Region

  def index(conn, _params) do
    regions = Repo.all(Region)
    render(conn, "index.html", regions: regions)
  end

  def new(conn, _params) do
    changeset = Region.changeset(%Region{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"region" => region_params}) do
    changeset = Region.changeset(%Region{}, region_params)

    case Repo.insert(changeset) do
      {:ok, _region} ->
        conn
        |> put_flash(:info, "Region created successfully.")
        |> redirect(to: html_region_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    region = Repo.get!(Region, id)
    render(conn, "show.html", region: region)
  end

  def edit(conn, %{"id" => id}) do
    region = Repo.get!(Region, id)
    changeset = Region.changeset(region)
    render(conn, "edit.html", region: region, changeset: changeset)
  end

  def update(conn, %{"id" => id, "region" => region_params}) do
    region = Repo.get!(Region, id)
    changeset = Region.changeset(region, region_params)

    case Repo.update(changeset) do
      {:ok, region} ->
        conn
        |> put_flash(:info, "Region updated successfully.")
        |> redirect(to: html_region_path(conn, :show, region))
      {:error, changeset} ->
        render(conn, "edit.html", region: region, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    region = Repo.get!(Region, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(region)

    conn
    |> put_flash(:info, "Region deleted successfully.")
    |> redirect(to: html_region_path(conn, :index))
  end
end
