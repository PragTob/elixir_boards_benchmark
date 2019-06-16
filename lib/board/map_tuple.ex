defmodule Board.MapTuple do
  @behaviour Board

  def new do
    # this is a bit unfair to all the others because it always
    # being empty can be a quite sharp speed advantage
    %{}
  end

  def get(board, x, y), do: board[{x, y}]

  def set(board, x, y, value) do
    Map.put(board, {x, y}, value)
  end
end
