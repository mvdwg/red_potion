defmodule RedPotion.Web.CounterValueController do
  use RedPotion.Web, :controller

  alias RedPotion.Artifacts

  def index(conn, _params) do
    counter_values = Artifacts.list_counter_values()
    render(conn, "index.html", counter_values: counter_values)
  end

  def new(conn, _params) do
    changeset = Artifacts.change_counter_value(%RedPotion.Artifacts.CounterValue{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"counter_value" => counter_value_params}) do
    case Artifacts.create_counter_value(counter_value_params) do
      {:ok, counter_value} ->
        conn
        |> put_flash(:info, "Counter value created successfully.")
        |> redirect(to: counter_value_path(conn, :show, 1, counter_value))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    counter_value = Artifacts.get_counter_value!(id)
    render(conn, "show.html", counter_value: counter_value)
  end

  def edit(conn, %{"id" => id}) do
    counter_value = Artifacts.get_counter_value!(id)
    changeset = Artifacts.change_counter_value(counter_value)
    render(conn, "edit.html", counter_value: counter_value, changeset: changeset)
  end

  def update(conn, %{"id" => id, "counter_value" => counter_value_params}) do
    counter_value = Artifacts.get_counter_value!(id)

    case Artifacts.update_counter_value(counter_value, counter_value_params) do
      {:ok, counter_value} ->
        conn
        |> put_flash(:info, "Counter value updated successfully.")
        |> redirect(to: counter_value_path(conn, :show, 1, counter_value))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", counter_value: counter_value, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    counter_value = Artifacts.get_counter_value!(id)
    {:ok, _counter_value} = Artifacts.delete_counter_value(counter_value)

    conn
    |> put_flash(:info, "Counter value deleted successfully.")
    |> redirect(to: counter_value_path(conn, :index, 1))
  end
end
