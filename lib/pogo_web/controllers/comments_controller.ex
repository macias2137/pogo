defmodule PogoWeb.CommentsController do
  use PogoWeb, :controller

  alias PogoWeb.Comments
  alias PogoWeb.Comments.Comment

  def index(conn, _params) do
    comments = Comments.list_comments()
  end

  def new(conn, %{"username" => username, "comment_text" => comment_text}) do
    Comments.add_new_comment(%{username: username, comment_text: comment_text})
    redirect(conn, to: Routes.forecasts_path(conn, :index))
  end
end
