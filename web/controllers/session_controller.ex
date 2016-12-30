defmodule Tox.SessionController do
  require Logger
  use Tox.Web, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => user,
                                    "password" => pass}}) do
    Logger.debug "Session Create"
    case Tox.Auth.login_by_email_and_pass(conn, user, pass,
          repo: Repo) do
      {:ok, conn} ->
        logged_in_user = Guardian.Plug.current_resource(conn)
        conn
        |> put_flash(:info, "Logged In as " <> logged_in_user.email)
        |> redirect(to: user_path(conn, :show, logged_in_user))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Wrong username/password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    Logger.debug "Session Delete"
    conn
    |> put_flash(:error, "Signed Out")
    |> Guardian.Plug.sign_out
    |> redirect(to: session_path(conn, :new))
  end
end
