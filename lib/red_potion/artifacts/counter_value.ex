defmodule RedPotion.Artifacts.CounterValue do
  use Ecto.Schema
  import Ecto.Changeset
  alias RedPotion.Artifacts.CounterValue


  schema "artifacts_counter_values" do
    field :value, :integer
    field :counter_id, :id

    timestamps()
  end

  @doc false
  def changeset(%CounterValue{} = counter_value, attrs) do
    counter_value
    |> cast(attrs, [:value, :counter_id])
    |> validate_required([:value, :counter_id])
  end
end
