defmodule Tox.HtmlDeliveryServiceTypeController do
  use Tox.Web, :controller

  alias Tox.DeliveryServiceType

  def index(conn, _params) do
    delivery_service_types = Repo.all(DeliveryServiceType)
    render(conn, "index.html", delivery_service_types: delivery_service_types)
  end

  def new(conn, _params) do
    changeset = DeliveryServiceType.changeset(%DeliveryServiceType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"delivery_service_type" => delivery_service_type_params}) do
    changeset = DeliveryServiceType.changeset(%DeliveryServiceType{}, delivery_service_type_params)

    case Repo.insert(changeset) do
      {:ok, _delivery_service_type} ->
        conn
        |> put_flash(:info, "Delivery service type created successfully.")
        |> redirect(to: html_delivery_service_type_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    delivery_service_type = Repo.get!(DeliveryServiceType, id)
    render(conn, "show.html", delivery_service_type: delivery_service_type)
  end

  def edit(conn, %{"id" => id}) do
    delivery_service_type = Repo.get!(DeliveryServiceType, id)
    changeset = DeliveryServiceType.changeset(delivery_service_type)
    render(conn, "edit.html", delivery_service_type: delivery_service_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "delivery_service_type" => delivery_service_type_params}) do
    delivery_service_type = Repo.get!(DeliveryServiceType, id)
    changeset = DeliveryServiceType.changeset(delivery_service_type, delivery_service_type_params)

    case Repo.update(changeset) do
      {:ok, delivery_service_type} ->
        conn
        |> put_flash(:info, "Delivery service type updated successfully.")
        |> redirect(to: html_delivery_service_type_path(conn, :show, delivery_service_type))
      {:error, changeset} ->
        render(conn, "edit.html", delivery_service_type: delivery_service_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    delivery_service_type = Repo.get!(DeliveryServiceType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(delivery_service_type)

    conn
    |> put_flash(:info, "Delivery service type deleted successfully.")
    |> redirect(to: html_delivery_service_type_path(conn, :index))
  end
end
