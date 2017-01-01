defmodule Tox.HtmlDeliveryserviceServerController do
  use Tox.Web, :controller

  alias Tox.DeliveryserviceServer

  def index(conn, _params) do
    deliveryserviceservers = Repo.all(DeliveryserviceServer)
    render(conn, "index.html", deliveryserviceservers: deliveryserviceservers)
  end

  def new(conn, _params) do
    changeset = DeliveryserviceServer.changeset(%DeliveryserviceServer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deliveryservice_server" => deliveryservice_server_params}) do
    changeset = DeliveryserviceServer.changeset(%DeliveryserviceServer{}, deliveryservice_server_params)

    case Repo.insert(changeset) do
      {:ok, _deliveryservice_server} ->
        conn
        |> put_flash(:info, "Delivery service server created successfully.")
        |> redirect(to: html_deliveryservice_server_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deliveryservice_server = Repo.get!(DeliveryserviceServer, id)
    render(conn, "show.html", deliveryservice_server: deliveryservice_server)
  end

  def edit(conn, %{"id" => id}) do
    deliveryservice_server = Repo.get!(DeliveryserviceServer, id)
    changeset = DeliveryserviceServer.changeset(deliveryservice_server)
    render(conn, "edit.html", deliveryservice_server: deliveryservice_server, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deliveryservice_server" => deliveryservice_server_params}) do
    deliveryservice_server = Repo.get!(DeliveryserviceServer, id)
    changeset = DeliveryserviceServer.changeset(deliveryservice_server, deliveryservice_server_params)

    case Repo.update(changeset) do
      {:ok, deliveryservice_server} ->
        conn
        |> put_flash(:info, "Delivery service server updated successfully.")
        |> redirect(to: html_deliveryservice_server_path(conn, :show, deliveryservice_server))
      {:error, changeset} ->
        render(conn, "edit.html", deliveryservice_server: deliveryservice_server, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deliveryservice_server = Repo.get!(DeliveryserviceServer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(deliveryservice_server)

    conn
    |> put_flash(:info, "Delivery service server deleted successfully.")
    |> redirect(to: html_deliveryservice_server_path(conn, :index))
  end
end
