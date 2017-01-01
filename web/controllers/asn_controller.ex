defmodule Tox.AsnController do
  use Tox.Web, :controller

  alias Tox.Asn

  def index(conn, _params) do
    asns = Repo.all(Asn)
    render(conn, "index.json", asns: asns)
  end

  def create(conn, %{"asn" => asn_params}) do
    changeset = Asn.changeset(%Asn{}, asn_params)

    case Repo.insert(changeset) do
      {:ok, asn} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", asn_path(conn, :show, asn))
        |> render("show.json", asn: asn)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    asn = Repo.get!(Asn, id)
    render(conn, "show.json", asn: asn)
  end

  def update(conn, %{"id" => id, "asn" => asn_params}) do
    asn = Repo.get!(Asn, id)
    changeset = Asn.changeset(asn, asn_params)

    case Repo.update(changeset) do
      {:ok, asn} ->
        render(conn, "show.json", asn: asn)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    asn = Repo.get!(Asn, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(asn)

    send_resp(conn, :no_content, "")
  end
end
