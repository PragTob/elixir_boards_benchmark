defmodule Board.ETSSet do
  @behaviour Board
  def new do
    board = :ets.new(:board, [:set, :public])

    Enum.each(0..8, fn x ->
      Enum.each(0..8, fn y ->
        :ets.insert(board, {{x, y}, nil})
      end)
    end)

    board
  end

  def get(board, x, y), do: :ets.lookup_element(board, {x, y}, 2)

  def set(board, x, y, value) do
    true = :ets.update_element(board, {x, y}, {2, value})
    board
  end
end
