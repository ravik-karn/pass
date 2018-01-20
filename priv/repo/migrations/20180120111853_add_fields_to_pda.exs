defmodule Pass.Repo.Migrations.AddaddsToPda do
  use Ecto.Migration

  def change do

    alter table(:pdas) do
      add :pda_description, :string
      add :pda_subject, :string
      add :pda_certifier, :string
      add :pda_date_start, :string
      add :pda_date_end, :string
      add :pda_key_cert, :string
      add :pda_key_sub, :string
      add :pda_unique, :string
      add :pda_data, :string
     end
   end

end
