defmodule Board do
  # can't be more specific witht types as each implementation has its own representation
  @type board :: any
  @type field :: any

  @callback new() :: board
  @callback get(board, non_neg_integer, non_neg_integer) :: field
  @callback set(board, non_neg_integer, non_neg_integer, field) :: board
end
