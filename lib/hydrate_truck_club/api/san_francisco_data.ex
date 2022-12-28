defmodule HydrateTruckClub.SanFranciscoData do
  @moduledoc """
  This module is responsible for making external API requests to the
  San Francisco Data API, which is powered by Socrata.

  All API Requests are decoded by Jason.
  """

  @food_truck_url "https://data.sfgov.org/resource/rqzj-sfat.json"

  def fetch_food_trucks() do
    with {:ok, %HTTPoison.Response{body: body}} <- HTTPoison.get(@food_truck_url),
         {:ok, decoded_truck_list} <- Jason.decode(body) do
      {:data_fetched, decoded_truck_list}
    else
      error ->
        {:data_not_fetched, error}
    end
  end
end
