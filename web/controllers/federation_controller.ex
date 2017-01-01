defmodule Tox.FederationController do
  use Tox.Web, :controller

  alias Tox.Federation

  def index(conn, _params) do
    federations = Repo.all(Federation)
    render(conn, "index.json", federations: federations)
  end

  def create(conn, %{"federation" => federation_params}) do
    changeset = Federation.changeset(%Federation{}, federation_params)

    case Repo.insert(changeset) do
      {:ok, federation} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", federation_path(conn, :show, federation))
        |> render("show.json", federation: federation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    federation = Repo.get!(Federation, id)
    render(conn, "show.json", federation: federation)
  end

  def update(conn, %{"id" => id, "federation" => federation_params}) do
    federation = Repo.get!(Federation, id)
    changeset = Federation.changeset(federation, federation_params)

    case Repo.update(changeset) do
      {:ok, federation} ->
        render(conn, "show.json", federation: federation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    federation = Repo.get!(Federation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(federation)

    send_resp(conn, :no_content, "")
  end
end
