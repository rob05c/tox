defmodule Tox.CdnController do
  use Tox.Web, :controller

  alias Tox.Cdn

  def index(conn, _params) do
    cdns = Repo.all(Cdn)
    render(conn, "index.json", cdns: cdns)
  end

  def create(conn, %{"cdn" => cdn_params}) do
    changeset = Cdn.changeset(%Cdn{}, cdn_params)

    case Repo.insert(changeset) do
      {:ok, cdn} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", cdn_path(conn, :show, cdn))
        |> render("show.json", cdn: cdn)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cdn = Repo.get!(Cdn, id)
    render(conn, "show.json", cdn: cdn)
  end

  def update(conn, %{"id" => id, "cdn" => cdn_params}) do
    cdn = Repo.get!(Cdn, id)
    changeset = Cdn.changeset(cdn, cdn_params)

    case Repo.update(changeset) do
      {:ok, cdn} ->
        render(conn, "show.json", cdn: cdn)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cdn = Repo.get!(Cdn, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cdn)

    send_resp(conn, :no_content, "")
  end
end
