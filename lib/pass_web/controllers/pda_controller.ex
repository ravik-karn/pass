defmodule PassWeb.PDAController do
  use PassWeb, :controller

  alias Pass.PA
  alias Pass.PA.PDA

  def index(conn, _params) do
    pdas = PA.list_pdas()
    render(conn, "index.html", pdas: pdas)
  end

  def new(conn, _params) do
    changeset = PA.change_pda(%PDA{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"pda" => pda_params}) do
    case PA.create_pda(pda_params) do
      {:ok, pda} ->
        conn
        |> put_flash(:info, "Pda created successfully.")
        |> redirect(to: pda_path(conn, :show, pda))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pda = PA.get_pda!(id)
    render(conn, "show.html", pda: pda)
  end

  def edit(conn, %{"id" => id}) do
    pda = PA.get_pda!(id)
    changeset = PA.change_pda(pda)
    render(conn, "edit.html", pda: pda, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pda" => pda_params}) do
    pda = PA.get_pda!(id)

    case PA.update_pda(pda, pda_params) do
      {:ok, pda} ->
        conn
        |> put_flash(:info, "Pda updated successfully.")
        |> redirect(to: pda_path(conn, :show, pda))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", pda: pda, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pda = PA.get_pda!(id)
    {:ok, _pda} = PA.delete_pda(pda)

    conn
    |> put_flash(:info, "Pda deleted successfully.")
    |> redirect(to: pda_path(conn, :index))
  end
end
