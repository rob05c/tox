defmodule Tox.DeliveryServiceController do
  use Tox.Web, :controller

  alias Tox.DeliveryService

  def index(conn, _params) do
    deliveryservices = Repo.all(DeliveryService)
    render(conn, "index.json", deliveryservices: deliveryservices)
  end

  def create(conn, %{"delivery_service" => delivery_service_params}) do
    changeset = DeliveryService.changeset(%DeliveryService{}, delivery_service_params)

    case Repo.insert(changeset) do
      {:ok, delivery_service} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", delivery_service_path(conn, :show, delivery_service))
        |> render("show.json", delivery_service: delivery_service)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    delivery_service = Repo.get!(DeliveryService, id)
    render(conn, "show.json", delivery_service: delivery_service)
  end

  def update(conn, %{"id" => id, "delivery_service" => delivery_service_params}) do
    delivery_service = Repo.get!(DeliveryService, id)
    changeset = DeliveryService.changeset(delivery_service, delivery_service_params)

    case Repo.update(changeset) do
      {:ok, delivery_service} ->
        render(conn, "show.json", delivery_service: delivery_service)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    delivery_service = Repo.get!(DeliveryService, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(delivery_service)

    send_resp(conn, :no_content, "")
  end
end
