defmodule Tox.HtmlTypeController do
  use Tox.Web, :controller

  alias Tox.Type

  def index(conn, _params) do
    types = Repo.all(Type)
    render(conn, "index.html", types: types)
  end

  def new(conn, _params) do
    changeset = Type.changeset(%Type{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"type" => type_params}) do
    changeset = Type.changeset(%Type{}, type_params)

    case Repo.insert(changeset) do
      {:ok, _type} ->
        conn
        |> put_flash(:info, "Type created successfully.")
        |> redirect(to: html_type_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    type = Repo.get!(Type, id)
    render(conn, "show.html", type: type)
  end

  def edit(conn, %{"id" => id}) do
    type = Repo.get!(Type, id)
    changeset = Type.changeset(type)
    render(conn, "edit.html", type: type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "type" => type_params}) do
    type = Repo.get!(Type, id)
    changeset = Type.changeset(type, type_params)

    case Repo.update(changeset) do
      {:ok, type} ->
        conn
        |> put_flash(:info, "Type updated successfully.")
        |> redirect(to: html_type_path(conn, :show, type))
      {:error, changeset} ->
        render(conn, "edit.html", type: type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    type = Repo.get!(Type, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(type)

    conn
    |> put_flash(:info, "Type deleted successfully.")
    |> redirect(to: html_type_path(conn, :index))
  end
end
