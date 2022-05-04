defmodule Pogo.Forecasts.Forecast do
  use Ecto.Schema
  import Ecto.Changeset

  schema "forecasts" do
    field :city, :string
    field :description, :string
    field :temperature, :integer
    field :icon, :string

    timestamps()
  end

  @doc false
  def changeset(forecast, attrs) do
    forecast
    |> cast(attrs, [:city, :temperature, :description, :icon])
    |> validate_required([:city, :temperature, :description, :icon])
  end
end
