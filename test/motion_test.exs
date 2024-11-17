defmodule MotionTest do
  use ExUnit.Case
  doctest Motion

  test "greets the world" do
    assert Motion.hello() == :world
  end
end
