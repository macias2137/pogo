defmodule Pogo.Forecasts do
  @moduledoc """
  The Forecasts context.
  """

  @openweatherapp_endpoint "https://api.openweathermap.org/data/2.5/weather?lat=52.2319581&lon=21.0067249&units=metric&appid=2e24f241347640bd3657813b4bd795a6"
  # "http://api.openweathermap.org/geo/1.0/direct?q=Warsaw&limit=1&lang=en&appid=2e24f241347640bd3657813b4bd795a6"

  import Ecto.Query, warn: false
  import HTTPoison, only: [get: 1]
  import Jason, only: [decode: 1]
  alias Pogo.Repo
  alias Pogo.Forecasts.Forecast

  def fetch_forecast_data do
    case HTTPoison.get(@openweatherapp_endpoint) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def process_forecast_data do
    body = fetch_forecast_data()
    {:ok, res} = Jason.decode(body)
    %{"name" => city, "main" => %{"temp" => temperature}, "weather" => [%{"description" => description, "icon" => icon}]} = res
    forecast = %Forecast{city: city, temperature: Kernel.round(temperature), description: description, icon: icon}
    Repo.insert(forecast)
  end

  def list_forecast do
    raise "TODO"
  end

  @doc """
  Gets a single forecast.

  Raises if the Forecast does not exist.

  ## Examples

      iex> get_forecast!(123)
      %Forecast{}

  """
  def get_forecast!(id), do: raise "TODO"

  @doc """
  Creates a forecast.

  ## Examples

      iex> create_forecast(%{field: value})
      {:ok, %Forecast{}}

      iex> create_forecast(%{field: bad_value})
      {:error, ...}

  """
  def create_forecast(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a forecast.

  ## Examples

      iex> update_forecast(forecast, %{field: new_value})
      {:ok, %Forecast{}}

      iex> update_forecast(forecast, %{field: bad_value})
      {:error, ...}

  """
  def update_forecast(%Forecast{} = forecast, attrs) do
    raise "TODO"
  end

  @doc """
  Deletes a Forecast.

  ## Examples

      iex> delete_forecast(forecast)
      {:ok, %Forecast{}}

      iex> delete_forecast(forecast)
      {:error, ...}

  """
  def delete_forecast(%Forecast{} = forecast) do
    raise "TODO"
  end

  @doc """
  Returns a data structure for tracking forecast changes.

  ## Examples

      iex> change_forecast(forecast)
      %Todo{...}

  """
  def change_forecast(%Forecast{} = forecast, _attrs \\ %{}) do
    raise "TODO"
  end
end
