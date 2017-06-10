defmodule RedPotion.Web.CounterValueControllerTest do
  use RedPotion.Web.ConnCase

  alias RedPotion.Artifacts

  @create_attrs %{value: 42}
  @update_attrs %{value: 43}
  @invalid_attrs %{value: nil}

  def fixture(:counter_value) do
    {:ok, counter_value} = Artifacts.create_counter_value(@create_attrs)
    counter_value
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, counter_value_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Counter values"
  end

  test "renders form for new counter_values", %{conn: conn} do
    conn = get conn, counter_value_path(conn, :new)
    assert html_response(conn, 200) =~ "New Counter value"
  end

  test "creates counter_value and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, counter_value_path(conn, :create), counter_value: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == counter_value_path(conn, :show, id)

    conn = get conn, counter_value_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Counter value"
  end

  test "does not create counter_value and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, counter_value_path(conn, :create), counter_value: @invalid_attrs
    assert html_response(conn, 200) =~ "New Counter value"
  end

  test "renders form for editing chosen counter_value", %{conn: conn} do
    counter_value = fixture(:counter_value)
    conn = get conn, counter_value_path(conn, :edit, counter_value)
    assert html_response(conn, 200) =~ "Edit Counter value"
  end

  test "updates chosen counter_value and redirects when data is valid", %{conn: conn} do
    counter_value = fixture(:counter_value)
    conn = put conn, counter_value_path(conn, :update, counter_value), counter_value: @update_attrs
    assert redirected_to(conn) == counter_value_path(conn, :show, counter_value)

    conn = get conn, counter_value_path(conn, :show, counter_value)
    assert html_response(conn, 200)
  end

  test "does not update chosen counter_value and renders errors when data is invalid", %{conn: conn} do
    counter_value = fixture(:counter_value)
    conn = put conn, counter_value_path(conn, :update, counter_value), counter_value: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Counter value"
  end

  test "deletes chosen counter_value", %{conn: conn} do
    counter_value = fixture(:counter_value)
    conn = delete conn, counter_value_path(conn, :delete, counter_value)
    assert redirected_to(conn) == counter_value_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, counter_value_path(conn, :show, counter_value)
    end
  end
end
