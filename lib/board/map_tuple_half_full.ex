defmodule Board.MapTupleHalfFull do
  @behaviour Board

  def new do
    0..4
    |> Enum.flat_map(fn x ->
      Enum.map(0..4, fn y ->
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
