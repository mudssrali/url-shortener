defmodule Challenge.URLShortener do
  @moduledoc """
  Documentation for URLShortener
  """

  @doc """
  Shorten a given url

  ## Examples

    iex> Challenge.URLShortener.shorten("www.google.com")
    "0a137b375cc3881a70e186ce2172c8d1"

    iex> Challenge.URLShortener.shorten(nil)
    {:error, :invalid_url}

  """
  @spec shorten(url :: binary()) :: binary() | {:error, :invalid_url}
  def shorten(url) when is_binary(url) do
    md5(url)
  end

  def shorten(_url), do: {:error, :invalid_url}

  defp md5(url) do
    :crypto.hash(:md5, url)
    |> Base.encode16(case: :lower)
  end
end
