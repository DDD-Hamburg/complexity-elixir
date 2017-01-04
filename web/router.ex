defmodule BusinessLogic.Router do
  use BusinessLogic.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BusinessLogic do
    pipe_through :api

    resources "/total", TotalController
  end
end

