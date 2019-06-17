defmodule Board.ProcessDictionary do
  @behaviour Board
  # On the wish of Michał https://twitter.com/michalmuskala/status/1140642976030494721
  # This is probably not the safest idea as we're essentially dealing with (process-) global state

  # this new is different as we're basically cleaning up the process
  # dictionary - let's hope no one calls it accidentally ;)
  def new() do
    Process.get_keys()
    |> Enum.each(&maybe_delete/1)

    # as the registry seems to implicitly use self we don't need
    # an actual board
    :process_registry_dummy
  end

  # delete key structures that we as "ours" - namely integer tuples
  # in our board range
  defp maybe_delete(key = {x, y}) when x in 0..8 and y in 0..8 do
    Process.delete(key)
  end

  defp maybe_delete(_not_our_key), do: nil

  def get(_board, x, y) do
    Process.get({x, y})
  end

  def set(_board, x, y, value) do
    Process.put({x, y}, value)

    :process_registry_dummy
  end
end
