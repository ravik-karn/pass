defmodule Pass.PA do
  @moduledoc """
  The PA context.
  """

  import Ecto.Query, warn: false
  alias Pass.Repo

  alias Pass.PA.PDA

  @doc """
  Returns the list of pdas.

  ## Examples

      iex> list_pdas()
      [%PDA{}, ...]

  """
  def list_pdas do
    Repo.all(PDA)
  end

  @doc """
  Gets a single pda.

  Raises `Ecto.NoResultsError` if the Pda does not exist.

  ## Examples

      iex> get_pda!(123)
      %PDA{}

      iex> get_pda!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pda!(id), do: Repo.get!(PDA, id)

  @doc """
  Creates a pda.

  ## Examples

      iex> create_pda(%{field: value})
      {:ok, %PDA{}}

      iex> create_pda(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pda(attrs \\ %{}) do
    %PDA{}
    |> PDA.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pda.

  ## Examples

      iex> update_pda(pda, %{field: new_value})
      {:ok, %PDA{}}

      iex> update_pda(pda, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pda(%PDA{} = pda, attrs) do
    pda
    |> PDA.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PDA.

  ## Examples

      iex> delete_pda(pda)
      {:ok, %PDA{}}

      iex> delete_pda(pda)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pda(%PDA{} = pda) do
    Repo.delete(pda)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pda changes.

  ## Examples

      iex> change_pda(pda)
      %Ecto.Changeset{source: %PDA{}}

  """
  def change_pda(%PDA{} = pda) do
    PDA.changeset(pda, %{})
  end
end
