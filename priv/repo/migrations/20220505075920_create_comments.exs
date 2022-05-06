defmodule Pogo.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :username, :string
      add :comment_text, :string
      add :forecast_id, references(:forecasts, on_delete: :delete_all)

      timestamps()
    end
  end
end
