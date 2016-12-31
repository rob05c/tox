defmodule Tox.HtmlDeliveryServiceController do
  use Tox.Web, :controller

  alias Tox.HtmlDeliveryService

  def index(conn, _params) do
    deliveryservices = Repo.all(Tox.DeliveryService)
    render(conn, "index.html", deliveryservices: deliveryservices)
  end

  def new(conn, _params) do
    changeset = Tox.DeliveryService.changeset(%Tox.DeliveryService{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"delivery_service" => delivery_service_params}) do
    changeset = Tox.DeliveryService.changeset(%Tox.DeliveryService{}, delivery_service_params)

    case Repo.insert(changeset) do
      {:ok, _delivery_service} ->
        conn
        |> put_flash(:info, "Delivery service created successfully.")
        |> redirect(to: html_delivery_service_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    delivery_service = Repo.get!(Tox.DeliveryService, id)
    render(conn, "show.html", delivery_service: delivery_service)
  end

  def edit(conn, %{"id" => id}) do
    delivery_service = Repo.get!(Tox.DeliveryService, id)
    changeset = Tox.DeliveryService.changeset(delivery_service)
    render(conn, "edit.html", delivery_service: delivery_service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "delivery_service" => delivery_service_params}) do
    delivery_service = Repo.get!(Tox.DeliveryService, id)
    changeset = Tox.DeliveryService.changeset(delivery_service, delivery_service_params)

    case Repo.update(changeset) do
      {:ok, delivery_service} ->
        conn
        |> put_flash(:info, "Delivery service updated successfully.")
        |> redirect(to: html_delivery_service_path(conn, :show, delivery_service))
      {:error, changeset} ->
        render(conn, "edit.html", delivery_service: delivery_service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    delivery_service = Repo.get!(Tox.DeliveryService, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(delivery_service)

    conn
    |> put_flash(:info, "delivery service deleted successfully.")
    |> redirect(to: html_delivery_service_path(conn, :index))
  end
end
