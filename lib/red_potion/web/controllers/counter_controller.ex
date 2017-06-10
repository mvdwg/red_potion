defmodule RedPotion.Web.CounterController do
  use RedPotion.Web, :controller

  alias RedPotion.Artifacts

  def index(conn, _params) do
    counters = Artifacts.list_counters()
    render(conn, "index.html", counters: counters)
  end

  def new(conn, _params) do
    changeset = Artifacts.change_counter(%RedPotion.Artifacts.Counter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"counter" => counter_params}) do
    case Artifacts.create_counter(counter_params) do
      {:ok, counter} ->
        conn
        |> put_flash(:info, "Counter created successfully.")
        |> redirect(to: counter_path(conn, :show, counter))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    counter = Artifacts.get_counter!(id)
    render(conn, "show.html", counter: counter)
  end

  def edit(conn, %{"id" => id}) do
    counter = Artifacts.get_counter!(id)
    changeset = Artifacts.change_counter(counter)
    render(conn, "edit.html", counter: counter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "counter" => counter_params}) do
    counter = Artifacts.get_counter!(id)

    case Artifacts.update_counter(counter, counter_params) do
      {:ok, counter} ->
        conn
        |> put_flash(:info, "Counter updated successfully.")
        |> redirect(to: counter_path(conn, :show, counter))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", counter: counter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    counter = Artifacts.get_counter!(id)
    {:ok, _counter} = Artifacts.delete_counter(counter)

    conn
    |> put_flash(:info, "Counter deleted successfully.")
    |> redirect(to: counter_path(conn, :index))
  end
end
