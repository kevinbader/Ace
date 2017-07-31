defmodule Ace.HPack do
  def new_context(table_size) do
    :cow_hpack.init(table_size)
  end

  def encode(headers, context) do
    {header_block, new_context} = :cow_hpack.encode(headers, context)
    header_block = :erlang.iolist_to_binary(header_block)
    {:ok, {header_block, new_context}}
  end

  def decode(header_block, context) do
    result = :cow_hpack.decode(header_block, context)
    IO.inspect(result)
    {:ok, result}
  end
end
