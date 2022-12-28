defmodule HydrateTruckClub.TrucksTest do
  use ExUnit.Case

  alias HydrateTruckClub.{Trucks, SanFranciscoData}

  setup do
    {:data_fetched, truck_list} = SanFranciscoData.fetch_food_trucks()

    %{
      truck_list: truck_list
    }
  end

  test "Filter with input empty", %{truck_list: truck_list} do
    [first_truck | _] = _filtered_trucks = Trucks.apply_filters(truck_list)

    assert first_truck["fooditems"]
  end

  test "Filter with input", %{truck_list: truck_list} do
    [first_truck | _] = _filtered_trucks = Trucks.apply_filters(truck_list, food_filter: "coffee")

    assert first_truck["fooditems"] =~ "coffee"
  end

  test "Filter with nonsense input and get empty list", %{truck_list: truck_list} do
    filtered_trucks = Trucks.apply_filters(truck_list, food_filter: "goobbleygook")

    assert filtered_trucks == []
  end
end
