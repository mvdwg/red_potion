defmodule RedPotion.Repo.Migrations.CreateRedPotion.Artifacts.CounterValue do
  use Ecto.Migration

  def change do
    create table(:artifacts_counter_values) do
      add :value, :integer
      add :counter_id, references(:artifacts_counters, on_delete: :nothing)

      timestamps()
    end

    create index(:artifacts_counter_values, [:counter_id])
  end
end
