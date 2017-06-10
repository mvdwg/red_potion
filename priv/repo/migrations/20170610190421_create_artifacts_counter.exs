defmodule RedPotion.Repo.Migrations.CreateRedPotion.Artifacts.Counter do
  use Ecto.Migration

  def change do
    create table(:artifacts_counters) do
      add :name, :string

      timestamps()
    end

  end
end
