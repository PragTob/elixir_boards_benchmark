defmodule Board.List1D do
  @behaviour Board

  @dimension 9
  @number_of_fields @dimension * @dimension
  def new do
    Enum.map(1..@number_of_fields, fn _ -> nil end)
  end

  def get(board, x, y), do: Enum.at(board, @dimension * x + y)

  def set(board, x, y, value) do
    List.replace_at(board, @dimension * x + y, value)
  end
end
