defmodule Pass.PA.PDA do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pass.PA.PDA


  schema "pdas" do
    field :pda_id, :integer
    field :pda_type, :string

    timestamps()
  end

  @doc false
  def changeset(%PDA{} = pda, attrs) do
    pda
    |> cast(attrs, [:pda_id, :pda_type])
    |> validate_required([:pda_id, :pda_type])
  end
end
