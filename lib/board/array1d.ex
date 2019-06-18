defmodule Board.Array1D do
  # Who new there was an array in erlang? 😅
  @behaviour Board

  @dimension 9
  def new() do
    :array.new(@dimension * @dimension, default: nil)
  end

  def get(board, x, y), do: :array.get(@dimension * x + y, board)

  def set(board, x, y, value) do
    :array.set(@dimension * x + y, value, board)
  end
end
