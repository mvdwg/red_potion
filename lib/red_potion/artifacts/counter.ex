defmodule RedPotion.Artifacts.Counter do
  use Ecto.Schema
  import Ecto.Changeset
  alias RedPotion.Artifacts.Counter


  schema "artifacts_counters" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Counter{} = counter, attrs) do
    counter
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
