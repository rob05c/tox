defmodule Tox.DeliveryserviceRegexController do
  use Tox.Web, :controller

  alias Tox.DeliveryserviceRegex

  def index(conn, _params) do
    deliveryserviceregexes = Repo.all(DeliveryserviceRegex)
    render(conn, "index.json", deliveryserviceregexes: deliveryserviceregexes)
  end

  def create(conn, %{"deliveryservice_regex" => deliveryservice_regex_params}) do
    changeset = DeliveryserviceRegex.changeset(%DeliveryserviceRegex{}, deliveryservice_regex_params)

    case Repo.insert(changeset) do
      {:ok, deliveryservice_regex} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", deliveryservice_regex_path(conn, :show, deliveryservice_regex))
        |> render("show.json", deliveryservice_regex: deliveryservice_regex)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deliveryservice_regex = Repo.get!(DeliveryserviceRegex, id)
    render(conn, "show.json", deliveryservice_regex: deliveryservice_regex)
  end

  def update(conn, %{"id" => id, "deliveryservice_regex" => deliveryservice_regex_params}) do
    deliveryservice_regex = Repo.get!(DeliveryserviceRegex, id)
    changeset = DeliveryserviceRegex.changeset(deliveryservice_regex, deliveryservice_regex_params)

    case Repo.update(changeset) do
      {:ok, deliveryservice_regex} ->
        render(conn, "show.json", deliveryservice_regex: deliveryservice_regex)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Tox.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deliveryservice_regex = Repo.get!(DeliveryserviceRegex, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(deliveryservice_regex)

    send_resp(conn, :no_content, "")
  end
end
