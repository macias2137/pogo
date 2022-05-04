defmodule Pogo.ForecastsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pogo.Forecasts` context.
  """

  @doc """
  Generate a forecast.
  """
  def forecast_fixture(attrs \\ %{}) do
    {:ok, forecast} =
      attrs
      |> Enum.into(%{

      })
      |> Pogo.Forecasts.create_forecast()

    forecast
  end
end
