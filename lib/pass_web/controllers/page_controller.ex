defmodule PassWeb.PageController do
  use PassWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
