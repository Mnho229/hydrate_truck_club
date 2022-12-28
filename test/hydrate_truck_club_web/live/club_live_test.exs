defmodule HydrateTruckClubWeb.ClubLiveTest do
  use HydrateTruckClubWeb.ConnCase

  test "GET /htc", %{conn: conn} do
    conn = get(conn, "/htc")
    assert html_response(conn, 200) =~ "Encouraging Beverage Prolificity"
  end
end
