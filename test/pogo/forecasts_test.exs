defmodule Pogo.ForecastsTest do
  use Pogo.DataCase

  alias Pogo.Forecasts

  describe "forecast" do
    alias Pogo.Forecasts.Forecast

    import Pogo.ForecastsFixtures

    @invalid_attrs %{}

    # test "list_forecasts/0 returns all forecasts" do
    #   forecast = forecast_fixture()
    #   assert Forecasts.list_forecasts() == [forecast]
    # end

    # test "get_forecast!/1 returns the forecast with given id" do
    #   forecast = forecast_fixture()
    #   assert Forecasts.get_forecast!(forecast.id) == forecast
    # end

    test "create_forecast/1 with valid data creates a forecast" do
      valid_attrs = %{city: "Koszalin", description: "windy", temperature: 22, icon: "01a"}
      assert {:ok, %Forecast{} = forecast} = Forecasts.create_forecast(valid_attrs)
    end

    test "create_forecast/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forecasts.create_forecast(@invalid_attrs)
    end
  end
end
