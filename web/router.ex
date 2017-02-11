defmodule Amulet.Router do
  use Amulet.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Amulet do
    pipe_through :api
  end
end
