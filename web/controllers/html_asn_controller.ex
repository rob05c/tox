defmodule Tox.HtmlAsnController do
  use Tox.Web, :controller

  alias Tox.Tox.Asn

  def index(conn, _params) do
    asns = Repo.all(Tox.Asn)
    render(conn, "index.html", asns: asns)
  end

  def new(conn, _params) do
    changeset = Tox.Asn.changeset(%Tox.Asn{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"asn" => asn_params}) do
    changeset = Tox.Asn.changeset(%Tox.Asn{}, asn_params)

    case Repo.insert(changeset) do
      {:ok, _asn} ->
        conn
        |> put_flash(:info, "ASN created successfully.")
        |> redirect(to: html_asn_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    asn = Repo.get!(Tox.Asn, id)
    render(conn, "show.html", asn: asn)
  end

  def edit(conn, %{"id" => id}) do
    asn = Repo.get!(Tox.Asn, id)
    changeset = Tox.Asn.changeset(asn)
    render(conn, "edit.html", asn: asn, changeset: changeset)
  end

  def update(conn, %{"id" => id, "asn" => asn_params}) do
    asn = Repo.get!(Tox.Asn, id)
    changeset = Tox.Asn.changeset(asn, asn_params)

    case Repo.update(changeset) do
      {:ok, asn} ->
        conn
        |> put_flash(:info, "ASN updated successfully.")
        |> redirect(to: html_asn_path(conn, :show, asn))
      {:error, changeset} ->
        render(conn, "edit.html", asn: asn, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    asn = Repo.get!(Tox.Asn, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(asn)

    conn
    |> put_flash(:info, "Asn deleted successfully.")
    |> redirect(to: html_asn_path(conn, :index))
  end
end
