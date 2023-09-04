defmodule Challenge.Server do
  @moduledoc """
  GenServer powered server to handles user requests
  """

  use GenServer

  alias Challenge.URLShortener

  # Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: __MODULE__])
  end

  def shorten(url) do
    GenServer.call(__MODULE__, {:shorten, url})
  end

  def get(short) do
    GenServer.call(__MODULE__, {:get, short})
  end

  def flush() do
    GenServer.cast(__MODULE__, :flush)
  end

  def stop() do
    GenServer.cast(__MODULE__, :stop)
  end

  def count() do
    GenServer.call(__MODULE__, :count)
  end

  # Callbacks

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_cast(:flush, _state) do
    {:noreply, %{}}
  end

  @impl true
  def handle_cast(:stop, state) do
    {:stop, :normal, state}
  end

  @impl true
  def handle_call({:shorten, url}, _from, state) do
    shortened = URLShortener.shorten(url)
    new_state = Map.put(state, shortened, url)
    {:reply, shortened, new_state}
  end

  def handle_call({:get, short}, _from, state) do
    res = Map.get(state, short) || {:error, :url_not_found}
    {:reply, res, state}
  end

  def handle_call(:count, _from, state) do
    count = Map.keys(state) |> Enum.count()
    {:reply, count, state}
  end
end
