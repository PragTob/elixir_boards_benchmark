# ElixirBoardsBenchmark

A benchmark of different possible implementations of a 2D game board in elixir. The current benchmark is specifically for the board size 9x9.

What is a board implementation? See the `Board` behaviour - creating a new board, `get(x, y)` and `set(x, y)`.

What is benchmarked?

* get of (0, 0), (4, 4) and (8, 8)
* set of (0, 0), (4, 4) and (8, 8)
* getting and setting of (0, 0), (4, 4) and (8, 8)
* getting and setting of all coordinates in one rune

## But Why?

Fun. No concrete use case at the moment other than looking at performance of different data structures in these circumstances.

## Adding your own implemenation?

Have another implementation? **Great!** Add it to `lib/board/` with a name describing the data structure, adopt the `Board` behaviour then add the module name to the module list in `test/board_test.exs` and `benchmark.exs`. Done! (if the tests pass and the benchmark runs of course)
