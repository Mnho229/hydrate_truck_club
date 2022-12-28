defmodule HydrateTruckClubWeb.ClubLive do
  use HydrateTruckClubWeb, :live_view

  alias HydrateTruckClub.{SanFranciscoData, Trucks}

  @default_assigns [
    all_trucks_with_drinks: [],
    filtered_trucks: [],
    error_statement: ""
  ]

  def mount(_params, _session, socket) do
    {:ok, assign(socket, @default_assigns)}
  end

  def handle_params(_params, _, socket) do
    case fetch_trucks() do
      {:ok, filtered_trucks} ->
        {:noreply,
         assign(socket, filtered_trucks: filtered_trucks, all_trucks_with_drinks: filtered_trucks)}

      {_, error_statement} ->
        {:noreply, assign(socket, error_statement: error_statement)}
    end
  end

  def handle_event("filter", params, socket) do
    %{"filter" => %{"food_filter" => food_filter}} = params
    %{all_trucks_with_drinks: trucks} = socket.assigns

    filtered_trucks = Trucks.apply_filters(trucks, food_filter: food_filter)

    {:noreply, assign(socket, filtered_trucks: filtered_trucks)}
  end

  defp fetch_trucks() do
    case SanFranciscoData.fetch_food_trucks() do
      {:data_fetched, unfiltered_trucks} ->
        {:ok, Trucks.apply_filters(unfiltered_trucks)}

      {:data_not_fetched, _} ->
        {:error, "We are sorry.  We are unable to access the San Francisco Open Truck List."}
    end

    with {:data_fetched, unfiltered_trucks} <- SanFranciscoData.fetch_food_trucks(),
         all_trucks_with_drinks <- Trucks.apply_filters(unfiltered_trucks) do
      {:ok, all_trucks_with_drinks}
    else
      {:data_not_fetched, _} ->
        {:error, "We are sorry.  We are unable to access the San Francisco Open Truck List."}
    end
  end
end
