defmodule ShortUUID do
  @moduledoc """
  Short UUID generator.
  """

  @base 58
  @chars "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
  @len 22

  @doc """
  Generate a random, base58 encoded, version 4 UUID.

  ## Examples

      iex> ShortUUID.generate()
      "oNLNNGPqHR4Go5AAxtzAQc"
  """
  def generate do
    uuid()
    |> convert()
  end

  defp uuid do
    <<u0::48, _::4, u1::12, _::2, u2::62>> = :crypto.strong_rand_bytes(16)
    <<u0::48, 4::4, u1::12, 2::2, u2::62>>
  end

  defp convert(uuid) do
    uuid
    |> :binary.decode_unsigned()
    |> Stream.unfold(fn n -> {rem(n, @base), div(n, @base)} end)
    |> Enum.take(@len)
    |> Enum.map(&:binary.at(@chars, &1))
    |> to_string()
  end
end
