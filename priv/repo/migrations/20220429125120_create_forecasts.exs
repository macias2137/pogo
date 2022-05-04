defmodule Pogo.Repo.Migrations.CreateForecasts do
  use Ecto.Migration

  def change do
    create table(:forecasts) do
      add :city, :string
      add :temperature, :integer
      add :description, :string
      add :icon, :string

      timestamps()
    end
  end
end
