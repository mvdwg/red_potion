defmodule RedPotion.Web.CounterControllerTest do
  use RedPotion.Web.ConnCase

  alias RedPotion.Artifacts

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:counter) do
    {:ok, counter} = Artifacts.create_counter(@create_attrs)
    counter
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, counter_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Counters"
  end

  test "renders form for new counters", %{conn: conn} do
    conn = get conn, counter_path(conn, :new)
    assert html_response(conn, 200) =~ "New Counter"
  end

  test "creates counter and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, counter_path(conn, :create), counter: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == counter_path(conn, :show, id)

    conn = get conn, counter_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Counter"
  end

  test "does not create counter and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, counter_path(conn, :create), counter: @invalid_attrs
    assert html_response(conn, 200) =~ "New Counter"
  end

  test "renders form for editing chosen counter", %{conn: conn} do
    counter = fixture(:counter)
    conn = get conn, counter_path(conn, :edit, counter)
    assert html_response(conn, 200) =~ "Edit Counter"
  end

  test "updates chosen counter and redirects when data is valid", %{conn: conn} do
    counter = fixture(:counter)
    conn = put conn, counter_path(conn, :update, counter), counter: @update_attrs
    assert redirected_to(conn) == counter_path(conn, :show, counter)

    conn = get conn, counter_path(conn, :show, counter)
    assert html_response(conn, 200) =~ "some updated name"
  end

  test "does not update chosen counter and renders errors when data is invalid", %{conn: conn} do
    counter = fixture(:counter)
    conn = put conn, counter_path(conn, :update, counter), counter: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Counter"
  end

  test "deletes chosen counter", %{conn: conn} do
    counter = fixture(:counter)
    conn = delete conn, counter_path(conn, :delete, counter)
    assert redirected_to(conn) == counter_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, counter_path(conn, :show, counter)
    end
  end
end
