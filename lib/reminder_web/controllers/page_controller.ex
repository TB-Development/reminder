defmodule ReminderWeb.PageController do
  use ReminderWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
