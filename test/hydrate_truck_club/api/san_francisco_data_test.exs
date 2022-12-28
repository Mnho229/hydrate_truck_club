defmodule HydrateTruckClub.SanFranciscoDataTest do
  use ExUnit.Case

  alias HydrateTruckClub.SanFranciscoData

  # Would prefer saving data via VCR so tests aren't relying on url being alive
  test "GET json from data.sfgov.org" do
    assert {:data_fetched, _} = SanFranciscoData.fetch_food_trucks()
  end
end
