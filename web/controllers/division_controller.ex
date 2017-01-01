defmodule Tox.DivisionController do
  use Tox.Web, :controller

  alias Tox.Division

  def index(conn, _params) do
    divisions = Repo.all(Division)
    render(conn, "index.json", divisions: divisions)
  end

  def create(conn, %{"division" => division_params}) do
    changeset = Division.changeset(%Division{}, division_params)

    case Repo.insert(changeset) do
      {:ok, division} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", division_path(conn, :show, division))
        |> render("show.json", division: division)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    division = Repo.get!(Division, id)
    render(conn, "show.json", division: division)
  end

  def update(conn, %{"id" => id, "division" => division_params}) do
    division = Repo.get!(Division, id)
    changeset = Division.changeset(division, division_params)

    case Repo.update(changeset) do
      {:ok, division} ->
        render(conn, "show.json", division: division)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    division = Repo.get!(Division, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(division)

    send_resp(conn, :no_content, "")
  end
end
