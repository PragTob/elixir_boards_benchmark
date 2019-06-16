defmodule Board.Map2D do
  @behaviour Board
  def new do
    0..8
    |> Enum.map(fn x ->
      {x, 0..8 |> Enum.map(fn y -> {y, nil} end) |> Map.new()}
    end)
    |> Map.new()
  end

  def get(board, x, y), do: board[x][y]

  def set(board, x, y, value) do
    put_in(board[x][y], value)
  end
end
