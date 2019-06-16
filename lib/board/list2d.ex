defmodule Board.List2D do
  @behaviour Board
  def new do
    Enum.map(1..9, fn _ ->
      Enum.map(1..9, fn _ -> nil end)
    end)
  end

  def get(board, x, y), do: board |> Enum.at(x) |> Enum.at(y)

  def set(board, x, y, value) do
    row =
      board
      |> Enum.at(x)
      |> List.replace_at(y, value)

    List.replace_at(board, x, row)
  end
end
