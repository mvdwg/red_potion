defmodule RedPotion.Artifacts.Counter do
  use Ecto.Schema
  import Ecto.Changeset
  alias RedPotion.Artifacts.{ Counter, CounterValue }


  schema "artifacts_counters" do
    field :name, :string
    has_many :values, CounterValue, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(%Counter{} = counter, attrs) do
    counter
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
