defmodule Tox.HtmlDeliveryserviceRegexController do
  use Tox.Web, :controller

  alias Tox.DeliveryserviceRegex

  def index(conn, _params) do
    deliveryserviceregexes = Repo.all(DeliveryserviceRegex)
    render(conn, "index.html", deliveryserviceregexes: deliveryserviceregexes)
  end

  def new(conn, _params) do
    changeset = DeliveryserviceRegex.changeset(%DeliveryserviceRegex{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deliveryservice_regex" => deliveryservice_regex_params}) do
    changeset = DeliveryserviceRegex.changeset(%DeliveryserviceRegex{}, deliveryservice_regex_params)

    case Repo.insert(changeset) do
      {:ok, _deliveryservice_regex} ->
        conn
        |> put_flash(:info, "Delivery service regex created successfully.")
        |> redirect(to: html_deliveryservice_regex_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deliveryservice_regex = Repo.get!(DeliveryserviceRegex, id)
    render(conn, "show.html", deliveryservice_regex: deliveryservice_regex)
  end

  def edit(conn, %{"id" => id}) do
    deliveryservice_regex = Repo.get!(DeliveryserviceRegex, id)
    changeset = DeliveryserviceRegex.changeset(deliveryservice_regex)
    render(conn, "edit.html", deliveryservice_regex: deliveryservice_regex, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deliveryservice_regex" => deliveryservice_regex_params}) do
    deliveryservice_regex = Repo.get!(DeliveryserviceRegex, id)
    changeset = DeliveryserviceRegex.changeset(deliveryservice_regex, deliveryservice_regex_params)

    case Repo.update(changeset) do
      {:ok, deliveryservice_regex} ->
        conn
        |> put_flash(:info, "Delivery service regex updated successfully.")
        |> redirect(to: html_deliveryservice_regex_path(conn, :show, deliveryservice_regex))
      {:error, changeset} ->
        render(conn, "edit.html", deliveryservice_regex: deliveryservice_regex, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deliveryservice_regex = Repo.get!(DeliveryserviceRegex, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(deliveryservice_regex)

    conn
    |> put_flash(:info, "Delivery service regex deleted successfully.")
    |> redirect(to: html_deliveryservice_regex_path(conn, :index))
  end
end
