defmodule Tox.PhysicalLocationController do
  use Tox.Web, :controller

  alias Tox.PhysicalLocation

  def index(conn, _params) do
    physicallocations = Repo.all(PhysicalLocation)
    render(conn, "index.json", physicallocations: physicallocations)
  end

  def create(conn, %{"physical_location" => physical_location_params}) do
    changeset = PhysicalLocation.changeset(%PhysicalLocation{}, physical_location_params)

    case Repo.insert(changeset) do
      {:ok, physical_location} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", physical_location_path(conn, :show, physical_location))
        |> render("show.json", physical_location: physical_location)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    physical_location = Repo.get!(PhysicalLocation, id)
    render(conn, "show.json", physical_location: physical_location)
  end

  def update(conn, %{"id" => id, "physical_location" => physical_location_params}) do
    physical_location = Repo.get!(PhysicalLocation, id)
    changeset = PhysicalLocation.changeset(physical_location, physical_location_params)

    case Repo.update(changeset) do
      {:ok, physical_location} ->
        render(conn, "show.json", physical_location: physical_location)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    physical_location = Repo.get!(PhysicalLocation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(physical_location)

    send_resp(conn, :no_content, "")
  end
end
