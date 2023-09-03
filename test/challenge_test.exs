defmodule ChallengeTest do
  use ExUnit.Case

  doctest Challenge.URLShortener

  test "generates shorten of valid url" do
    assert Challenge.shorten("www.google.com") == "0a137b375cc3881a70e186ce2172c8d1"
  end

  test "generates shorten of in valid url" do
    assert Challenge.shorten(nil) == {:error, :invalid_url}
  end

  test "cleans up in-memory store" do
    assert Challenge.clean() == :ok
  end

  test "counts the generated url" do
    _shortened = Challenge.shorten("www.google.com")
    assert Challenge.count() > 0
  end
end
