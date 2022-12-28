defmodule HydrateTruckClubWeb.PageController do
  use HydrateTruckClubWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
