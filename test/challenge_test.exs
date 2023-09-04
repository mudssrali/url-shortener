defmodule ChallengeTest do
  use ExUnit.Case

  doctest Challenge.URLShortener

  @url "www.google.com"

  test "generates shorten of valid url" do
    assert "0a137b375cc3881a70e186ce2172c8d1" = Challenge.shorten(@url)
  end

  test "generates shorten of in valid url" do
    assert Challenge.shorten(nil) == {:error, :invalid_url}
  end

  test "gets a redirect url using valid shorten string" do
    short = Challenge.shorten(@url)
    assert @url = Challenge.get(short)
  end

  test "try getting redirect url using invalid shorten string" do
    assert {:error, :url_not_found} = Challenge.get("example")
  end

  test "cleans up in-memory store" do
    assert Challenge.clean() == :ok
  end

  test "counts the generated url" do
    _shortened = Challenge.shorten(@url)
    assert Challenge.count() > 0
  end
end
