defmodule Pass.PA.PDA do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pass.PA.PDA


  schema "pdas" do
    field :pda_id, :integer
    field :pda_type, :string
    field :pda_description, :string
    field :pda_subject, :string
    field :pda_certifier, :string
    field :pda_date_start, :string
    field :pda_date_end, :string
    field :pda_key_cert, :string
    field :pda_key_sub, :string
    field :pda_unique, :string
    field :pda_data, :string


    timestamps()
  end

  @doc false
  def changeset(%PDA{} = pda, attrs) do
    pda
    |> cast(attrs, [:pda_type, :pda_subject, :pda_certifier, :pda_data])
    |> validate_required([:pda_type, :pda_certifier, :pda_subject])
  end
end
