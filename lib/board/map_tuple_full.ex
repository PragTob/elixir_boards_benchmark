defmodule Board.MapTupleFull do
  @behaviour Board

  @dimension 9
  def new do
    1..@dimension
    |> Enum.flat_map(fn x ->
      Enum.map(1..@dimension, fn y ->
        {{x, y}, nil}
      end)
    end)
    |> Map.new()
  end

  def get(board, x, y), do: board[{x, y}]

  def set(board, x, y, value) do
    Map.put(board, {x, y}, value)
  end
end
