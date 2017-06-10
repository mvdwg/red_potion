defmodule RedPotion.Web.CounterValueController do
  use RedPotion.Web, :controller

  alias RedPotion.Artifacts

  def index(conn, params) do
    counter = Artifacts.get_counter_with_values!(params["counter_id"])
    render(conn, "index.html", counter_values: counter.values, counter: counter)
  end

  # GET /counters/:counter_id/values/new
  def new(conn, params) do
    counter = Artifacts.get_counter!(params["counter_id"])
    changeset = Artifacts.change_counter_value(%RedPotion.Artifacts.CounterValue{})
    render(conn, "new.html", changeset: changeset, counter: counter)
  end

  def create(conn, %{"counter_value" => counter_value_params, "counter_id" => counter_id}) do
    counter_value_params
    |> Map.put("counter_id", counter_id)
    |> IO.inspect
    |> Artifacts.create_counter_value
    |> case do
      {:ok, _counter_value} ->
        conn
        |> put_flash(:info, "Counter value created successfully.")
        |> redirect(to: counter_value_path(conn, :index, counter_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
