defmodule ReminderWeb.Router do
  use ReminderWeb, :router

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

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end

  scope "/", ReminderWeb do
    pipe_through :browser

    get "/", BillController, :index
    resources "/bills", BillController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReminderWeb do
  #   pipe_through :api
  # end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ReminderWeb.Telemetry
    end
  end
end
