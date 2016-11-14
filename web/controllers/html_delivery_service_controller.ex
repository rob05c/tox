defmodule Tox.HtmlDeliveryServiceController do
  use Tox.Web, :controller

  alias Tox.HtmlDeliveryService

  def index(conn, _params) do
    deliveryservices = Repo.all(HtmlDeliveryService)
    render(conn, "index.html", deliveryservices: deliveryservices)
  end

  def new(conn, _params) do
    changeset = HtmlDeliveryService.changeset(%HtmlDeliveryService{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"html_delivery_service" => html_delivery_service_params}) do
    changeset = HtmlDeliveryService.changeset(%HtmlDeliveryService{}, html_delivery_service_params)

    case Repo.insert(changeset) do
      {:ok, _html_delivery_service} ->
        conn
        |> put_flash(:info, "Html delivery service created successfully.")
        |> redirect(to: html_delivery_service_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    html_delivery_service = Repo.get!(HtmlDeliveryService, id)
    render(conn, "show.html", html_delivery_service: html_delivery_service)
  end

  def edit(conn, %{"id" => id}) do
    html_delivery_service = Repo.get!(HtmlDeliveryService, id)
    changeset = HtmlDeliveryService.changeset(html_delivery_service)
    render(conn, "edit.html", html_delivery_service: html_delivery_service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "html_delivery_service" => html_delivery_service_params}) do
    html_delivery_service = Repo.get!(HtmlDeliveryService, id)
    changeset = HtmlDeliveryService.changeset(html_delivery_service, html_delivery_service_params)

    case Repo.update(changeset) do
      {:ok, html_delivery_service} ->
        conn
        |> put_flash(:info, "Html delivery service updated successfully.")
        |> redirect(to: html_delivery_service_path(conn, :show, html_delivery_service))
      {:error, changeset} ->
        render(conn, "edit.html", html_delivery_service: html_delivery_service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    html_delivery_service = Repo.get!(HtmlDeliveryService, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(html_delivery_service)

    conn
    |> put_flash(:info, "Html delivery service deleted successfully.")
    |> redirect(to: html_delivery_service_path(conn, :index))
  end
end
