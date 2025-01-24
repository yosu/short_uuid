defmodule ShortUUIDTest do
  use ExUnit.Case

  test "generate a short uuid" do
    id = ShortUUID.generate()
    assert is_binary(id)
    assert String.length(id) == 22
  end

  test "generate two ids" do
    assert ShortUUID.generate() != ShortUUID.generate()
  end
end
