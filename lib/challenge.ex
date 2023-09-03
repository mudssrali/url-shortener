defmodule Challenge do
  @moduledoc """
  Documentation for `Challenge`.
  """

  alias Challenge.Server

  @doc """
  Shorten url
  """
  @spec shorten(url :: binary()) :: binary() | {:error, :invalid_url}
  def shorten(url) do
    Server.shorten(url)
  end

  @doc """
  Get a redirect url
  """
  @spec get(short :: binary()) :: binary() | {:error, :url_not_found}
  def get(short) do
    Server.get(short)
  end

  @doc """
  Clean up in-memory store
  """
  @spec clean() :: map()
  def clean do
    Server.flush()
  end

  @doc """
  Get count of generated short urls
  """
  @spec count() :: integer()
  def count() do
    Server.count()
  end
end
