defmodule HydrateTruckClub.Trucks do
  @moduledoc """
  This context module is responsible for all food truck related reductions.
  """

  # Allow only trucks that serve beverages
  @drink_terms ["beverage", "soda", "drink", "coffee", "everything", "water", "tea", "boba"]

  @spec apply_filters(list(), list()) :: list
  def apply_filters(unfiltered_trucks, opts \\ [])

  def apply_filters(unfiltered_trucks, opts) do
    input_filter = opts[:food_filter] || ""

    unfiltered_trucks
    |> Enum.filter(&Map.has_key?(&1, "fooditems"))
    |> Enum.filter(fn truck ->
      %{"fooditems" => fooditems} = truck

      String.contains?(String.downcase(fooditems), @drink_terms) &&
        String.contains?(String.downcase(fooditems), input_filter)
    end)
    |> Enum.filter(&(&1["status"] == "APPROVED"))
  end
end
