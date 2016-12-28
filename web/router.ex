defmodule Tox.Router do
  use Tox.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tox do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/servers", HtmlServerController
    resources "/deliveryservices", HtmlDeliveryServiceController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  scope "/api", Tox do
    pipe_through :api

    resources "/servers", ServerController, except: [:new, :edit]
    resources "/deliveryservices", DeliveryServiceController, except: [:new, :edit]
  end
end
