defmodule PassWeb.PageController do
  use PassWeb, :controller
  use Drab.Controller

  def index(conn, _params) do
    render conn, "index.html", welcome_text: "Welcome to Phoenix!"
  end
end
