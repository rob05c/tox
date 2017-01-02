defmodule Tox.RegionController do
  use Tox.Web, :controller

  alias Tox.Region

  def index(conn, _params) do
    regions = Repo.all(Region)
    render(conn, "index.json", regions: regions)
  end

  def create(conn, %{"region" => region_params}) do
    changeset = Region.changeset(%Region{}, region_params)

    case Repo.insert(changeset) do
      {:ok, region} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", region_path(conn, :show, region))
        |> render("show.json", region: region)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    region = Repo.get!(Region, id)
    render(conn, "show.json", region: region)
  end

  def update(conn, %{"id" => id, "region" => region_params}) do
    region = Repo.get!(Region, id)
    changeset = Region.changeset(region, region_params)

    case Repo.update(changeset) do
      {:ok, region} ->
        render(conn, "show.json", region: region)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    region = Repo.get!(Region, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(region)

    send_resp(conn, :no_content, "")
  end
end
