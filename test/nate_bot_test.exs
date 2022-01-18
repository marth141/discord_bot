defmodule NateBotTest do
  use ExUnit.Case
  doctest NateBot

  test "greets the world" do
    assert NateBot.hello() == :world
  end
end
