defmodule Pogo.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :username, :string
    field :comment_text, :string
    belongs_to :forecast, Pogo.Forecasts.Forecast

    timestamps()
  end

  @doc false
  def changeset(comments, attrs) do
    comments
    |> cast(attrs, [:username, :comment_text, :forecast_id])
    |> validate_required([:user, :comment_text, :forecast_id])
  end
end
