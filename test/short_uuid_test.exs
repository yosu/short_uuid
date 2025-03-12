defmodule ShortUUIDTest do
  use ExUnit.Case

  @uuid "DGQ71Fxt6USdp3EJ1ArGWu"

  describe "generate/0" do
    test "generates a short uuid" do
      id = ShortUUID.generate()
      assert is_binary(id)
      assert String.length(id) == 22
    end

    test "generates different uuids each time" do
      assert ShortUUID.generate() != ShortUUID.generate()
    end
  end

  describe "cast/2" do
    test "can cast short uuids" do
      assert {:ok, _} = ShortUUID.cast(@uuid, %{})
    end

    test "can cast nil" do
      assert {:ok, _} = ShortUUID.cast(nil, %{})
    end

    test "can cast prefixed short uuids" do
      assert {:ok, _} = ShortUUID.cast("prefix_" <> @uuid, %{prefix: "prefix_"})
    end

    test "reject other type values" do
      assert :error == ShortUUID.cast(0, %{})
      assert :error == ShortUUID.cast(1, %{})
      assert :error == ShortUUID.cast(true, %{})
      assert :error == ShortUUID.cast(false, %{})
    end
  end

  describe "load/3" do
    test "can load short uuids" do
      assert {:ok, _} = ShortUUID.load(@uuid, nil, %{})
    end

    test "can load nil" do
      assert {:ok, _} = ShortUUID.load(nil, nil, %{})
    end

    test "can load prefixed short uuids" do
      assert {:ok, _} = ShortUUID.load("prefix_" <> @uuid, nil, %{prefix: "prefix_"})
    end

    test "reject other type values" do
      assert :error == ShortUUID.load(0, nil, %{})
      assert :error == ShortUUID.load(1, nil, %{})
      assert :error == ShortUUID.load(true, nil, %{})
      assert :error == ShortUUID.load(false, nil, %{})
    end
  end

  describe "dump/3" do
    test "can dump short uuids" do
      assert {:ok, _} = ShortUUID.dump(@uuid, nil, %{})
    end

    test "can dump nil uuids" do
      assert {:ok, _} = ShortUUID.dump(nil, nil, %{})
    end

    test "can dump prefixed short uuids" do
      assert {:ok, _} = ShortUUID.dump("prefix_" <> @uuid, nil, %{prefix: "prefix_"})
    end

    test "reject other type values" do
      assert :error == ShortUUID.dump(0, nil, %{})
      assert :error == ShortUUID.dump(1, nil, %{})
      assert :error == ShortUUID.dump(true, nil, %{})
      assert :error == ShortUUID.dump(false, nil, %{})
    end
  end

  describe "embed_as/2" do
    test "returns always :self" do
      assert :self == ShortUUID.embed_as(@uuid, %{})
      assert :self == ShortUUID.embed_as(:any_value, %{})
    end
  end

  describe "type/1" do
    test "returns :string" do
      assert :string == ShortUUID.type(%{})
      assert :string == ShortUUID.type(%{prefix: "prefix_"})
    end
  end

  describe "equal/3" do
    test "returns true for equivalent uuids" do
      assert ShortUUID.equal?(@uuid, @uuid, %{})
      assert ShortUUID.equal?("p_" <> @uuid, "p_" <> @uuid, %{prefix: "p_"})
    end

    test "returns false for different uuids" do
      uuid1 = ShortUUID.autogenerate(%{})
      uuid2 = ShortUUID.autogenerate(%{})

      refute ShortUUID.equal?(uuid1, uuid2, %{})
    end
  end
end
