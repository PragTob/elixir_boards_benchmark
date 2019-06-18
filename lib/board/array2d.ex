defmodule Board.Array2D do
  # Who new there was an array in erlang? 😅
  @behaviour Board

  @dimension 9
  def new() do
    array = :array.new(@dimension)

    :array.map(fn _, _ -> :array.new(@dimension, default: nil) end, array)
  end

  def get(board, x, y) do
    column = :array.get(x, board)
    :array.get(y, column)
  end

  def set(board, x, y, value) do
    column = :array.get(x, board)
    column = :array.set(y, value, column)

    :array.set(x, column, board)
  end
end
