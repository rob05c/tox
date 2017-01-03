defmodule Tox.DeliveryServiceTypeController do
  use Tox.Web, :controller

  alias Tox.DeliveryServiceType

  def index(conn, _params) do
    delivery_service_types = Repo.all(DeliveryServiceType)
    render(conn, "index.json", delivery_service_types: delivery_service_types)
  end

  def create(conn, %{"delivery_service_type" => delivery_service_type_params}) do
    changeset = DeliveryServiceType.changeset(%DeliveryServiceType{}, delivery_service_type_params)

    case Repo.insert(changeset) do
      {:ok, delivery_service_type} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", delivery_service_type_path(conn, :show, delivery_service_type))
        |> render("show.json", delivery_service_type: delivery_service_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    delivery_service_type = Repo.get!(DeliveryServiceType, id)
    render(conn, "show.json", delivery_service_type: delivery_service_type)
  end

  def update(conn, %{"id" => id, "delivery_service_type" => delivery_service_type_params}) do
    delivery_service_type = Repo.get!(DeliveryServiceType, id)
    changeset = DeliveryServiceType.changeset(delivery_service_type, delivery_service_type_params)

    case Repo.update(changeset) do
      {:ok, delivery_service_type} ->
        render(conn, "show.json", delivery_service_type: delivery_service_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    delivery_service_type = Repo.get!(DeliveryServiceType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(delivery_service_type)

    send_resp(conn, :no_content, "")
  end
end
