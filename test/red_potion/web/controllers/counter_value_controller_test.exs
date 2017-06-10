defmodule RedPotion.Web.CounterValueControllerTest do
  use RedPotion.Web.ConnCase

  alias RedPotion.Artifacts

  @create_attrs %{value: 1}

  def counter_fixture(attrs \\ %{}) do
    {:ok, counter} =
      attrs
      |> Enum.into(%{name: "some name"})
      |> Artifacts.create_counter()

    counter
  end

  def fixture(:counter_value) do
    {:ok, counter_value} = Artifacts.create_counter_value(@create_attrs)
    counter_value
  end

  setup(%{conn: conn}) do
    {:ok, %{ counter: counter_fixture(), conn: conn }}
  end

  test "lists all entries on index", %{conn: conn, counter: counter} do
    conn = get conn, counter_value_path(conn, :index, counter.id )
    assert html_response(conn, 200) =~ "Listing Counter values"
  end

  test "renders form for new counter_values", %{conn: conn, counter: counter} do
    conn = get conn, counter_value_path(conn, :new, counter.id)
    assert html_response(conn, 200) =~ "New Counter value"
  end
end
