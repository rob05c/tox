defmodule Tox.DeliveryserviceServerController do
  use Tox.Web, :controller

  alias Tox.DeliveryserviceServer

  def index(conn, _params) do
    deliveryserviceservers = Repo.all(DeliveryserviceServer)
    render(conn, "index.json", deliveryserviceservers: deliveryserviceservers)
  end

  def create(conn, %{"deliveryservice_server" => deliveryservice_server_params}) do
    changeset = DeliveryserviceServer.changeset(%DeliveryserviceServer{}, deliveryservice_server_params)

    case Repo.insert(changeset) do
      {:ok, deliveryservice_server} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", deliveryservice_server_path(conn, :show, deliveryservice_server))
        |> render("show.json", deliveryservice_server: deliveryservice_server)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deliveryservice_server = Repo.get!(DeliveryserviceServer, id)
    render(conn, "show.json", deliveryservice_server: deliveryservice_server)
  end

  def update(conn, %{"id" => id, "deliveryservice_server" => deliveryservice_server_params}) do
    deliveryservice_server = Repo.get!(DeliveryserviceServer, id)
    changeset = DeliveryserviceServer.changeset(deliveryservice_server, deliveryservice_server_params)

    case Repo.update(changeset) do
      {:ok, deliveryservice_server} ->
        render(conn, "show.json", deliveryservice_server: deliveryservice_server)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deliveryservice_server = Repo.get!(DeliveryserviceServer, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(deliveryservice_server)

    send_resp(conn, :no_content, "")
  end
end
