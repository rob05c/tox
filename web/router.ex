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
    resources "/asns", HtmlAsnController
    resources "/cachegroups", HtmlCachegroupController
    resources "/cachegroupparameters", HtmlCachegroupParameterController
    resources "/cdns", HtmlCdnController
    resources "/deliveryserviceregexes", HtmlDeliveryserviceRegexController
    resources "/deliveryserviceservers", HtmlDeliveryserviceServerController
    resources "/divisions", HtmlDivisionController
    resources "/federations", HtmlFederationController
    resources "/hardware", HtmlHardwareController
    resources "/parameters", HtmlParameterController
  end

  # Other scopes may use custom stacks.
  scope "/api", Tox do
    pipe_through :api # TODO auth, and readme instructions

    resources "/servers", ServerController, except: [:new, :edit]
    resources "/deliveryservices", DeliveryServiceController, except: [:new, :edit]
    resources "/asns", AsnController, except: [:new, :edit]
    resources "/cachegroups", CachegroupController, except: [:new, :edit]
    resources "/cachegroupparameters", CachegroupParameterController, except: [:new, :edit]
    resources "/cdns", CdnController, except: [:new, :edit]
    resources "/deliveryserviceregexes", DeliveryserviceRegexController, except: [:new, :edit]
    resources "/deliveryserviceservers", DeliveryserviceServerController, except: [:new, :edit]
    resources "/divisions", DivisionController, except: [:new, :edit]
    resources "/federations", FederationController, except: [:new, :edit]
    resources "/hardware", HardwareController, except: [:new, :edit]
    resources "/parameters", ParameterController, except: [:new, :edit]
  end
end
