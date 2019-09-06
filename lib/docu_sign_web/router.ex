defmodule DocuSignWeb.Router do
  use DocuSignWeb, :router

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

  scope "/", DocuSignWeb do
    pipe_through [:browser, DocuSignWeb.Plugs.Guest]

    resources "/register", UserController, only: [:create, :new, :index, :show]
    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  scope "/", DocuSignWeb do
    pipe_through [:browser, DocuSignWeb.Plugs.Auth]

    get "/logout", SessionController, :delete

    get "/", PageController, :index
    get "/show", PageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", DocuSignWeb do
  #   pipe_through :api
  # end
end
