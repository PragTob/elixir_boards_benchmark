defmodule Board.Tuple2D do
  @behaviour Board

  def new do
    {
      {nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil},
      {nil, nil, nil, nil, nil, nil, nil, nil, nil}
    }
  end

  def get(board, x, y), do: board |> elem(x) |> elem(y)

  def set(board, x, y, value) do
    row =
      board
      |> elem(x)
      |> put_elem(y, value)

    put_elem(board, x, row)
  end
end
