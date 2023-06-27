defmodule CommandedTestTest do
  use ExUnit.Case
  doctest CommandedTest

  test "greets the world" do
    assert CommandedTest.hello() == :world
  end
end
