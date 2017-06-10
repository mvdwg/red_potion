defmodule RedPotion.Artifacts do
  @moduledoc """
  The boundary for the Artifacts system.
  """

  import Ecto.Query, warn: false
  alias RedPotion.Repo

  alias RedPotion.Artifacts.Counter

  @doc """
  Returns the list of counters.

  ## Examples

      iex> list_counters()
      [%Counter{}, ...]

  """
  def list_counters do
    Repo.all(Counter)
  end

  @doc """
  Gets a single counter.

  Raises `Ecto.NoResultsError` if the Counter does not exist.

  ## Examples

      iex> get_counter!(123)
      %Counter{}

      iex> get_counter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_counter!(id), do: Repo.get!(Counter, id)

  @doc """
  Creates a counter.

  ## Examples

      iex> create_counter(%{field: value})
      {:ok, %Counter{}}

      iex> create_counter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_counter(attrs \\ %{}) do
    %Counter{}
    |> Counter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a counter.

  ## Examples

      iex> update_counter(counter, %{field: new_value})
      {:ok, %Counter{}}

      iex> update_counter(counter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_counter(%Counter{} = counter, attrs) do
    counter
    |> Counter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Counter.

  ## Examples

      iex> delete_counter(counter)
      {:ok, %Counter{}}

      iex> delete_counter(counter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_counter(%Counter{} = counter) do
    Repo.delete(counter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking counter changes.

  ## Examples

      iex> change_counter(counter)
      %Ecto.Changeset{source: %Counter{}}

  """
  def change_counter(%Counter{} = counter) do
    Counter.changeset(counter, %{})
  end

  alias RedPotion.Artifacts.CounterValue

  @doc """
  Returns the list of counter_values.

  ## Examples

      iex> list_counter_values()
      [%CounterValue{}, ...]

  """
  def list_counter_values do
    Repo.all(CounterValue)
  end

  @doc """
  Gets a single counter_value.

  Raises `Ecto.NoResultsError` if the Counter value does not exist.

  ## Examples

      iex> get_counter_value!(123)
      %CounterValue{}

      iex> get_counter_value!(456)
      ** (Ecto.NoResultsError)

  """
  def get_counter_value!(id), do: Repo.get!(CounterValue, id)

  @doc """
  Creates a counter_value.

  ## Examples

      iex> create_counter_value(%{field: value})
      {:ok, %CounterValue{}}

      iex> create_counter_value(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_counter_value(attrs \\ %{}) do
    %CounterValue{}
    |> CounterValue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a counter_value.

  ## Examples

      iex> update_counter_value(counter_value, %{field: new_value})
      {:ok, %CounterValue{}}

      iex> update_counter_value(counter_value, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_counter_value(%CounterValue{} = counter_value, attrs) do
    counter_value
    |> CounterValue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CounterValue.

  ## Examples

      iex> delete_counter_value(counter_value)
      {:ok, %CounterValue{}}

      iex> delete_counter_value(counter_value)
      {:error, %Ecto.Changeset{}}

  """
  def delete_counter_value(%CounterValue{} = counter_value) do
    Repo.delete(counter_value)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking counter_value changes.

  ## Examples

      iex> change_counter_value(counter_value)
      %Ecto.Changeset{source: %CounterValue{}}

  """
  def change_counter_value(%CounterValue{} = counter_value) do
    CounterValue.changeset(counter_value, %{})
  end
end
