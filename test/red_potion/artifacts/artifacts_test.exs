defmodule RedPotion.ArtifactsTest do
  use RedPotion.DataCase

  alias RedPotion.Artifacts

  @valid_attrs %{name: "some name"}

  def counter_fixture(attrs \\ %{}) do
    {:ok, counter} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Artifacts.create_counter()

    counter
  end
 
  describe "counters" do
    alias RedPotion.Artifacts.Counter

    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    test "list_counters/0 returns all counters" do
      counter = counter_fixture()
      assert Artifacts.list_counters() == [counter]
    end

    test "get_counter!/1 returns the counter with given id" do
      counter = counter_fixture()
      assert Artifacts.get_counter!(counter.id) == counter
    end

    test "create_counter/1 with valid data creates a counter" do
      assert {:ok, %Counter{} = counter} = Artifacts.create_counter(@valid_attrs)
      assert counter.name == "some name"
    end

    test "create_counter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Artifacts.create_counter(@invalid_attrs)
    end

    test "update_counter/2 with valid data updates the counter" do
      counter = counter_fixture()
      assert {:ok, counter} = Artifacts.update_counter(counter, @update_attrs)
      assert %Counter{} = counter
      assert counter.name == "some updated name"
    end

    test "update_counter/2 with invalid data returns error changeset" do
      counter = counter_fixture()
      assert {:error, %Ecto.Changeset{}} = Artifacts.update_counter(counter, @invalid_attrs)
      assert counter == Artifacts.get_counter!(counter.id)
    end

    test "delete_counter/1 deletes the counter" do
      counter = counter_fixture()
      assert {:ok, %Counter{}} = Artifacts.delete_counter(counter)
      assert_raise Ecto.NoResultsError, fn -> Artifacts.get_counter!(counter.id) end
    end

    test "change_counter/1 returns a counter changeset" do
      counter = counter_fixture()
      assert %Ecto.Changeset{} = Artifacts.change_counter(counter)
    end
  end

  describe "counter_values" do
    alias RedPotion.Artifacts.{ CounterValue, Counter }

    def counter_value_fixture(%Counter{ id: id }) do
      {:ok, counter_value} = Artifacts.create_counter_value(%{ value: 1, counter_id: id })

      counter_value
    end

    setup do
      {:ok, %{ counter: counter_fixture()}}
    end

    test "list_counter_values/0 returns all counter_values", %{ counter: counter } do
      counter_value = counter_value_fixture(counter)
      assert Artifacts.list_counter_values() == [counter_value]
    end

    test "get_counter_value!/1 returns the counter_value with given id", %{ counter: counter } do
      counter_value = counter_value_fixture(counter)
      assert Artifacts.get_counter_value!(counter_value.id) == counter_value
    end

    test "create_counter_value/1 with valid data creates a counter_value", %{ counter: counter } do
      assert {:ok, %CounterValue{} = counter_value} = Artifacts.create_counter_value(%{ value: 1, counter_id: counter.id})
      assert counter_value.value == 1 
    end

    test "create_counter_value/1 with invalid data returns error changeset", %{ counter: counter } do
      assert {:error, %Ecto.Changeset{}} = Artifacts.create_counter_value(%{ value: nil, counter_id: counter.id })
    end
  end
end
