defmodule Tox.Router do
  use Tox.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: Tox.Token
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tox do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/", Tox do
    pipe_through [:browser, :browser_auth]
    resources "/users", UserController, only: [:show, :index, :update]
    resources "/servers", HtmlServerController
    resources "/deliveryservices", HtmlDeliveryServiceController
  end

  # Other scopes may use custom stacks.
  scope "/api", Tox do
    pipe_through :api

    resources "/servers", ServerController, except: [:new, :edit]
    resources "/deliveryservices", DeliveryServiceController, except: [:new, :edit]
  end
end
