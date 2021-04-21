defmodule InfractionsControlWeb.Router do
  use InfractionsControlWeb, :router

  alias InfractionsControlWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", InfractionsControlWeb do
    pipe_through :api

    resources "/infractions", InfractionsController, except: [:new, :edit]
    resources "/vehicles", VehiclesController, except: [:new, :edit]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: InfractionsControlWeb.Telemetry
    end
  end
end
