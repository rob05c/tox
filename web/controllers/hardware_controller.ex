defmodule Tox.HardwareController do
  use Tox.Web, :controller

  alias Tox.Hardware

  def index(conn, _params) do
    hardwares = Repo.all(Hardware)
    render(conn, "index.json", hardwares: hardwares)
  end

  def create(conn, %{"hardware" => hardware_params}) do
    changeset = Hardware.changeset(%Hardware{}, hardware_params)

    case Repo.insert(changeset) do
      {:ok, hardware} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", hardware_path(conn, :show, hardware))
        |> render("show.json", hardware: hardware)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hardware = Repo.get!(Hardware, id)
    render(conn, "show.json", hardware: hardware)
  end

  def update(conn, %{"id" => id, "hardware" => hardware_params}) do
    hardware = Repo.get!(Hardware, id)
    changeset = Hardware.changeset(hardware, hardware_params)

    case Repo.update(changeset) do
      {:ok, hardware} ->
        render(conn, "show.json", hardware: hardware)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hardware = Repo.get!(Hardware, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(hardware)

    send_resp(conn, :no_content, "")
  end
end
