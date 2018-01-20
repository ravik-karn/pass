defmodule Pass.Repo.Migrations.CreatePdas do
  use Ecto.Migration

  def change do
    create table(:pdas) do
      add :pda_id, :integer
      add :pda_type, :string

      timestamps()
    end

  end
end
