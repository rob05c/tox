defmodule Tox.HtmlPhysicalLocationController do
  use Tox.Web, :controller

  alias Tox.PhysicalLocation

  def index(conn, _params) do
    physicallocations = Repo.all(PhysicalLocation)
    render(conn, "index.html", physicallocations: physicallocations)
  end

  def new(conn, _params) do
    changeset = PhysicalLocation.changeset(%PhysicalLocation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"physical_location" => physical_location_params}) do
    changeset = PhysicalLocation.changeset(%PhysicalLocation{}, physical_location_params)

    case Repo.insert(changeset) do
      {:ok, _physical_location} ->
        conn
        |> put_flash(:info, "Physical location created successfully.")
        |> redirect(to: html_physical_location_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    physical_location = Repo.get!(PhysicalLocation, id)
    render(conn, "show.html", physical_location: physical_location)
  end

  def edit(conn, %{"id" => id}) do
    physical_location = Repo.get!(PhysicalLocation, id)
    changeset = PhysicalLocation.changeset(physical_location)
    render(conn, "edit.html", physical_location: physical_location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "physical_location" => physical_location_params}) do
    physical_location = Repo.get!(PhysicalLocation, id)
    changeset = PhysicalLocation.changeset(physical_location, physical_location_params)

    case Repo.update(changeset) do
      {:ok, physical_location} ->
        conn
        |> put_flash(:info, "Physical location updated successfully.")
        |> redirect(to: html_physical_location_path(conn, :show, physical_location))
      {:error, changeset} ->
        render(conn, "edit.html", physical_location: physical_location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    physical_location = Repo.get!(PhysicalLocation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(physical_location)

    conn
    |> put_flash(:info, "Physical location deleted successfully.")
    |> redirect(to: html_physical_location_path(conn, :index))
  end
end
