defmodule Tox.HtmlHardwareController do
  use Tox.Web, :controller

  alias Tox.Hardware

  def index(conn, _params) do
    hardwares = Repo.all(Hardware)
    render(conn, "index.html", hardwares: hardwares)
  end

  def new(conn, _params) do
    changeset = Hardware.changeset(%Hardware{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hardware" => hardware_params}) do
    changeset = Hardware.changeset(%Hardware{}, hardware_params)

    case Repo.insert(changeset) do
      {:ok, _hardware} ->
        conn
        |> put_flash(:info, "Hardware created successfully.")
        |> redirect(to: html_hardware_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hardware = Repo.get!(Hardware, id)
    render(conn, "show.html", hardware: hardware)
  end

  def edit(conn, %{"id" => id}) do
    hardware = Repo.get!(Hardware, id)
    changeset = Hardware.changeset(hardware)
    render(conn, "edit.html", hardware: hardware, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hardware" => hardware_params}) do
    hardware = Repo.get!(Hardware, id)
    changeset = Hardware.changeset(hardware, hardware_params)

    case Repo.update(changeset) do
      {:ok, hardware} ->
        conn
        |> put_flash(:info, "Hardware updated successfully.")
        |> redirect(to: html_hardware_path(conn, :show, hardware))
      {:error, changeset} ->
        render(conn, "edit.html", hardware: hardware, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hardware = Repo.get!(Hardware, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(hardware)

    conn
    |> put_flash(:info, "Hardware deleted successfully.")
    |> redirect(to: html_hardware_path(conn, :index))
  end
end
