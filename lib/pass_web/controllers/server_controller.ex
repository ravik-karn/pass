defmodule PassWeb.ServerController do
  use PassWeb, :controller

  alias Pass.PA
  alias Pass.PA.PDA

  def index(conn, _params) do
    pdas = PA.list_pdas()
    render(conn, "index.html", pdas: pdas)
  end

  def show(conn, %{"id" => id}) do
    pda = PA.get_pda!(id)
    render(conn, "show.html", pda: pda)
  end

end
