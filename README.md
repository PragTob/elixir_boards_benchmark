# ElixirBoardsBenchmark

A benchmark of different possible implementations of a 2D game board in elixir. The current benchmark is specifically for the **board size 9x9**.

What is a board implementation? See the `Board` behaviour - creating a new board, `get(x, y)` and `set(x, y)`.

What is benchmarked?

* get of (0, 0), (4, 4) and (8, 8)
* set of (0, 0), (4, 4) and (8, 8)
* getting and setting of (0, 0), (4, 4) and (8, 8)
* getting and setting of all coordinates in one rune

The benchmarking code itself is in [benchmark.exs](https://github.com/PragTob/elixir_boards_benchmark/blob/master/benchmark.exs).

Table of Contents
=================

   * [ElixirBoardsBenchmark](#elixirboardsbenchmark)
      * [But Why?](#but-why)
      * [Adding your own implemenation?](#adding-your-own-implemenation)
      * [Results](#results)
         * [System Information](#system-information)
         * [Getting and Setting Full Board](#getting-and-setting-full-board)
         * [Mixed Bag (3 sets, 3 gets)](#mixed-bag-3-sets-3-gets)
         * [get(0,0)](#get00)
         * [get(4, 4)](#get4-4)
         * [get (8, 8)](#get-8-8)
         * [set(0, 0)](#set0-0)
         * [set(4, 4)](#set4-4)
         * [set(8, 8)](#set8-8)

## But Why?

Fun. No concrete use case at the moment other than looking at performance of different data structures in these circumstances. Additionally, this happened to have been one of the first questions [I asked the elixir community](https://groups.google.com/forum/#!topic/elixir-lang-talk/wZdchFo4JUU).

## Adding your own implemenation?

Have another implementation? **Great!** Add it to `lib/board/` with a name describing the data structure, adopt the `Board` behaviour then add the module name to the module list in `test/board_test.exs` and `benchmark.exs`. Done! (if the tests pass and the benchmark runs of course)

## Results

### System Information


<table style="width: 1%">
  <tr>
    <th style="width: 1%; white-space: nowrap">Operating System</th>
    <td>Linux</td>
  </tr><tr>
    <th style="white-space: nowrap">CPU Information</th>
    <td style="white-space: nowrap">Intel(R) Core(TM) i7-4790 CPU @ 3.60GHz</td>
  </tr><tr>
    <th style="white-space: nowrap">Number of Available Cores</th>
    <td style="white-space: nowrap">8</td>
  </tr><tr>
    <th style="white-space: nowrap">Available Memory</th>
    <td style="white-space: nowrap">15.61 GB</td>
  </tr><tr>
    <th style="white-space: nowrap">Elixir Version</th>
    <td style="white-space: nowrap">1.8.2</td>
  </tr><tr>
    <th style="white-space: nowrap">Erlang Version</th>
    <td style="white-space: nowrap">22.0</td>
  </tr>
</table>


### Getting and Setting Full Board

Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">134.98 K</td>
    <td style="white-space: nowrap; text-align: right">7.41 μs</td>
    <td style="white-space: nowrap; text-align: right">±53.74%</td>
    <td style="white-space: nowrap; text-align: right">6.84 μs</td>
    <td style="white-space: nowrap; text-align: right">11.83 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">134.44 K</td>
    <td style="white-space: nowrap; text-align: right">7.44 μs</td>
    <td style="white-space: nowrap; text-align: right">±43.15%</td>
    <td style="white-space: nowrap; text-align: right">7.09 μs</td>
    <td style="white-space: nowrap; text-align: right">11.97 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">125.46 K</td>
    <td style="white-space: nowrap; text-align: right">7.97 μs</td>
    <td style="white-space: nowrap; text-align: right">±26.09%</td>
    <td style="white-space: nowrap; text-align: right">7.63 μs</td>
    <td style="white-space: nowrap; text-align: right">16.14 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">60.17 K</td>
    <td style="white-space: nowrap; text-align: right">16.62 μs</td>
    <td style="white-space: nowrap; text-align: right">±9.78%</td>
    <td style="white-space: nowrap; text-align: right">16.09 μs</td>
    <td style="white-space: nowrap; text-align: right">21.06 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">56.31 K</td>
    <td style="white-space: nowrap; text-align: right">17.76 μs</td>
    <td style="white-space: nowrap; text-align: right">±10.80%</td>
    <td style="white-space: nowrap; text-align: right">16.77 μs</td>
    <td style="white-space: nowrap; text-align: right">24.39 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">38.78 K</td>
    <td style="white-space: nowrap; text-align: right">25.79 μs</td>
    <td style="white-space: nowrap; text-align: right">±7.48%</td>
    <td style="white-space: nowrap; text-align: right">24.96 μs</td>
    <td style="white-space: nowrap; text-align: right">30.91 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">36.37 K</td>
    <td style="white-space: nowrap; text-align: right">27.50 μs</td>
    <td style="white-space: nowrap; text-align: right">±9.87%</td>
    <td style="white-space: nowrap; text-align: right">27.48 μs</td>
    <td style="white-space: nowrap; text-align: right">33.32 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">29.34 K</td>
    <td style="white-space: nowrap; text-align: right">34.08 μs</td>
    <td style="white-space: nowrap; text-align: right">±3.77%</td>
    <td style="white-space: nowrap; text-align: right">33.85 μs</td>
    <td style="white-space: nowrap; text-align: right">36.72 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">24.63 K</td>
    <td style="white-space: nowrap; text-align: right">40.60 μs</td>
    <td style="white-space: nowrap; text-align: right">±4.40%</td>
    <td style="white-space: nowrap; text-align: right">40.55 μs</td>
    <td style="white-space: nowrap; text-align: right">45.26 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">15.29 K</td>
    <td style="white-space: nowrap; text-align: right">65.41 μs</td>
    <td style="white-space: nowrap; text-align: right">±3.04%</td>
    <td style="white-space: nowrap; text-align: right">64.98 μs</td>
    <td style="white-space: nowrap; text-align: right">70.72 μs</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap;text-align: right">134.98 K</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">134.44 K</td>
    <td style="white-space: nowrap; text-align: right">1.0x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">125.46 K</td>
    <td style="white-space: nowrap; text-align: right">1.08x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">60.17 K</td>
    <td style="white-space: nowrap; text-align: right">2.24x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">56.31 K</td>
    <td style="white-space: nowrap; text-align: right">2.4x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">38.78 K</td>
    <td style="white-space: nowrap; text-align: right">3.48x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">36.37 K</td>
    <td style="white-space: nowrap; text-align: right">3.71x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">29.34 K</td>
    <td style="white-space: nowrap; text-align: right">4.6x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">24.63 K</td>
    <td style="white-space: nowrap; text-align: right">5.48x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">15.29 K</td>
    <td style="white-space: nowrap; text-align: right">8.83x</td>
  </tr>
</table>

Memory Usage
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">Memory</th>
      <th style="text-align: right">Factor</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap">54.91 KB</td>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap">18.51 KB</td>
    <td>0.34x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap">12.74 KB</td>
    <td>0.23x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap">11.55 KB</td>
    <td>0.21x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap">26.32 KB</td>
    <td>0.48x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap">11.55 KB</td>
    <td>0.21x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap">49.55 KB</td>
    <td>0.9x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap">22.60 KB</td>
    <td>0.41x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap">45.22 KB</td>
    <td>0.82x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap">59.38 KB</td>
    <td>1.08x</td>
  </tr>
</table>

<hr/>


### Mixed Bag (3 sets, 3 gets)

Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">5.40 M</td>
    <td style="white-space: nowrap; text-align: right">185.06 ns</td>
    <td style="white-space: nowrap; text-align: right">±985.83%</td>
    <td style="white-space: nowrap; text-align: right">144 ns</td>
    <td style="white-space: nowrap; text-align: right">445.59 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">4.83 M</td>
    <td style="white-space: nowrap; text-align: right">206.96 ns</td>
    <td style="white-space: nowrap; text-align: right">±1027.27%</td>
    <td style="white-space: nowrap; text-align: right">179 ns</td>
    <td style="white-space: nowrap; text-align: right">463 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">4.29 M</td>
    <td style="white-space: nowrap; text-align: right">233.07 ns</td>
    <td style="white-space: nowrap; text-align: right">±970.36%</td>
    <td style="white-space: nowrap; text-align: right">212 ns</td>
    <td style="white-space: nowrap; text-align: right">303 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">2.05 M</td>
    <td style="white-space: nowrap; text-align: right">488.56 ns</td>
    <td style="white-space: nowrap; text-align: right">±20.79%</td>
    <td style="white-space: nowrap; text-align: right">474 ns</td>
    <td style="white-space: nowrap; text-align: right">692.01 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">1.76 M</td>
    <td style="white-space: nowrap; text-align: right">568.34 ns</td>
    <td style="white-space: nowrap; text-align: right">±33.42%</td>
    <td style="white-space: nowrap; text-align: right">535 ns</td>
    <td style="white-space: nowrap; text-align: right">1488 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">1.16 M</td>
    <td style="white-space: nowrap; text-align: right">860.70 ns</td>
    <td style="white-space: nowrap; text-align: right">±19.74%</td>
    <td style="white-space: nowrap; text-align: right">802 ns</td>
    <td style="white-space: nowrap; text-align: right">1951.48 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">1.11 M</td>
    <td style="white-space: nowrap; text-align: right">899.78 ns</td>
    <td style="white-space: nowrap; text-align: right">±27.74%</td>
    <td style="white-space: nowrap; text-align: right">858 ns</td>
    <td style="white-space: nowrap; text-align: right">1802.79 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">0.91 M</td>
    <td style="white-space: nowrap; text-align: right">1098.31 ns</td>
    <td style="white-space: nowrap; text-align: right">±43.50%</td>
    <td style="white-space: nowrap; text-align: right">1058 ns</td>
    <td style="white-space: nowrap; text-align: right">1495.02 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">0.81 M</td>
    <td style="white-space: nowrap; text-align: right">1234.98 ns</td>
    <td style="white-space: nowrap; text-align: right">±66.77%</td>
    <td style="white-space: nowrap; text-align: right">1191 ns</td>
    <td style="white-space: nowrap; text-align: right">3137.68 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">0.43 M</td>
    <td style="white-space: nowrap; text-align: right">2347.66 ns</td>
    <td style="white-space: nowrap; text-align: right">±61.42%</td>
    <td style="white-space: nowrap; text-align: right">2234 ns</td>
    <td style="white-space: nowrap; text-align: right">3413 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap;text-align: right">5.40 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">4.83 M</td>
    <td style="white-space: nowrap; text-align: right">1.12x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">4.29 M</td>
    <td style="white-space: nowrap; text-align: right">1.26x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">2.05 M</td>
    <td style="white-space: nowrap; text-align: right">2.64x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">1.76 M</td>
    <td style="white-space: nowrap; text-align: right">3.07x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">1.16 M</td>
    <td style="white-space: nowrap; text-align: right">4.65x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">1.11 M</td>
    <td style="white-space: nowrap; text-align: right">4.86x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">0.91 M</td>
    <td style="white-space: nowrap; text-align: right">5.93x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">0.81 M</td>
    <td style="white-space: nowrap; text-align: right">6.67x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">0.43 M</td>
    <td style="white-space: nowrap; text-align: right">12.69x</td>
  </tr>
</table>

Memory Usage
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">Memory</th>
      <th style="text-align: right">Factor</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap">1344 B</td>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap">512 B</td>
    <td>0.38x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap">368 B</td>
    <td>0.27x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap">400 B</td>
    <td>0.3x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap">248 B</td>
    <td>0.18x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap">1712 B</td>
    <td>1.27x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap">248 B</td>
    <td>0.18x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap">656 B</td>
    <td>0.49x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap">1504 B</td>
    <td>1.12x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap">2048 B</td>
    <td>1.52x</td>
  </tr>
</table>

<hr/>

### get(0,0)

Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">37.47 M</td>
    <td style="white-space: nowrap; text-align: right">26.69 ns</td>
    <td style="white-space: nowrap; text-align: right">±538.54%</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
    <td style="white-space: nowrap; text-align: right">40 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">37.40 M</td>
    <td style="white-space: nowrap; text-align: right">26.74 ns</td>
    <td style="white-space: nowrap; text-align: right">±554.65%</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
    <td style="white-space: nowrap; text-align: right">58 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">27.53 M</td>
    <td style="white-space: nowrap; text-align: right">36.32 ns</td>
    <td style="white-space: nowrap; text-align: right">±1752.39%</td>
    <td style="white-space: nowrap; text-align: right">35 ns</td>
    <td style="white-space: nowrap; text-align: right">42 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">16.56 M</td>
    <td style="white-space: nowrap; text-align: right">60.40 ns</td>
    <td style="white-space: nowrap; text-align: right">±105.77%</td>
    <td style="white-space: nowrap; text-align: right">55 ns</td>
    <td style="white-space: nowrap; text-align: right">110 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">14.99 M</td>
    <td style="white-space: nowrap; text-align: right">66.71 ns</td>
    <td style="white-space: nowrap; text-align: right">±30.51%</td>
    <td style="white-space: nowrap; text-align: right">66 ns</td>
    <td style="white-space: nowrap; text-align: right">143 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">14.12 M</td>
    <td style="white-space: nowrap; text-align: right">70.82 ns</td>
    <td style="white-space: nowrap; text-align: right">±23.77%</td>
    <td style="white-space: nowrap; text-align: right">68 ns</td>
    <td style="white-space: nowrap; text-align: right">111 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">11.39 M</td>
    <td style="white-space: nowrap; text-align: right">87.77 ns</td>
    <td style="white-space: nowrap; text-align: right">±14.37%</td>
    <td style="white-space: nowrap; text-align: right">84 ns</td>
    <td style="white-space: nowrap; text-align: right">113 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">10.22 M</td>
    <td style="white-space: nowrap; text-align: right">97.83 ns</td>
    <td style="white-space: nowrap; text-align: right">±97.79%</td>
    <td style="white-space: nowrap; text-align: right">89 ns</td>
    <td style="white-space: nowrap; text-align: right">219 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.40 M</td>
    <td style="white-space: nowrap; text-align: right">106.37 ns</td>
    <td style="white-space: nowrap; text-align: right">±118.99%</td>
    <td style="white-space: nowrap; text-align: right">103 ns</td>
    <td style="white-space: nowrap; text-align: right">149 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.05 M</td>
    <td style="white-space: nowrap; text-align: right">165.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±26.96%</td>
    <td style="white-space: nowrap; text-align: right">160 ns</td>
    <td style="white-space: nowrap; text-align: right">276.58 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap;text-align: right">37.47 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">37.40 M</td>
    <td style="white-space: nowrap; text-align: right">1.0x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">27.53 M</td>
    <td style="white-space: nowrap; text-align: right">1.36x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">16.56 M</td>
    <td style="white-space: nowrap; text-align: right">2.26x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">14.99 M</td>
    <td style="white-space: nowrap; text-align: right">2.5x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">14.12 M</td>
    <td style="white-space: nowrap; text-align: right">2.65x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">11.39 M</td>
    <td style="white-space: nowrap; text-align: right">3.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">10.22 M</td>
    <td style="white-space: nowrap; text-align: right">3.67x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.40 M</td>
    <td style="white-space: nowrap; text-align: right">3.99x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.05 M</td>
    <td style="white-space: nowrap; text-align: right">6.19x</td>
  </tr>
</table>


<hr/>

### get(4, 4)

Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">37.04 M</td>
    <td style="white-space: nowrap; text-align: right">26.99 ns</td>
    <td style="white-space: nowrap; text-align: right">±809.36%</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
    <td style="white-space: nowrap; text-align: right">40 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">36.94 M</td>
    <td style="white-space: nowrap; text-align: right">27.07 ns</td>
    <td style="white-space: nowrap; text-align: right">±1617.99%</td>
    <td style="white-space: nowrap; text-align: right">25 ns</td>
    <td style="white-space: nowrap; text-align: right">41 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">26.62 M</td>
    <td style="white-space: nowrap; text-align: right">37.56 ns</td>
    <td style="white-space: nowrap; text-align: right">±117.59%</td>
    <td style="white-space: nowrap; text-align: right">35 ns</td>
    <td style="white-space: nowrap; text-align: right">109 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">14.60 M</td>
    <td style="white-space: nowrap; text-align: right">68.48 ns</td>
    <td style="white-space: nowrap; text-align: right">±28.03%</td>
    <td style="white-space: nowrap; text-align: right">64 ns</td>
    <td style="white-space: nowrap; text-align: right">106 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.78 M</td>
    <td style="white-space: nowrap; text-align: right">102.28 ns</td>
    <td style="white-space: nowrap; text-align: right">±15.70%</td>
    <td style="white-space: nowrap; text-align: right">102 ns</td>
    <td style="white-space: nowrap; text-align: right">147 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.18 M</td>
    <td style="white-space: nowrap; text-align: right">108.94 ns</td>
    <td style="white-space: nowrap; text-align: right">±14.90%</td>
    <td style="white-space: nowrap; text-align: right">107 ns</td>
    <td style="white-space: nowrap; text-align: right">149 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">6.09 M</td>
    <td style="white-space: nowrap; text-align: right">164.11 ns</td>
    <td style="white-space: nowrap; text-align: right">±63.99%</td>
    <td style="white-space: nowrap; text-align: right">155 ns</td>
    <td style="white-space: nowrap; text-align: right">269 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.73 M</td>
    <td style="white-space: nowrap; text-align: right">174.57 ns</td>
    <td style="white-space: nowrap; text-align: right">±33.56%</td>
    <td style="white-space: nowrap; text-align: right">169 ns</td>
    <td style="white-space: nowrap; text-align: right">213.78 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">4.27 M</td>
    <td style="white-space: nowrap; text-align: right">234.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±30.04%</td>
    <td style="white-space: nowrap; text-align: right">228 ns</td>
    <td style="white-space: nowrap; text-align: right">465 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">2.42 M</td>
    <td style="white-space: nowrap; text-align: right">413.63 ns</td>
    <td style="white-space: nowrap; text-align: right">±9.16%</td>
    <td style="white-space: nowrap; text-align: right">409 ns</td>
    <td style="white-space: nowrap; text-align: right">641 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap;text-align: right">37.04 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">36.94 M</td>
    <td style="white-space: nowrap; text-align: right">1.0x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">26.62 M</td>
    <td style="white-space: nowrap; text-align: right">1.39x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">14.60 M</td>
    <td style="white-space: nowrap; text-align: right">2.54x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.78 M</td>
    <td style="white-space: nowrap; text-align: right">3.79x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.18 M</td>
    <td style="white-space: nowrap; text-align: right">4.04x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">6.09 M</td>
    <td style="white-space: nowrap; text-align: right">6.08x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.73 M</td>
    <td style="white-space: nowrap; text-align: right">6.47x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">4.27 M</td>
    <td style="white-space: nowrap; text-align: right">8.67x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">2.42 M</td>
    <td style="white-space: nowrap; text-align: right">15.32x</td>
  </tr>
</table>


<hr/>

### get (8, 8)

Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">158.13 M</td>
    <td style="white-space: nowrap; text-align: right">6.32 ns</td>
    <td style="white-space: nowrap; text-align: right">±6667.00%</td>
    <td style="white-space: nowrap; text-align: right">4 ns</td>
    <td style="white-space: nowrap; text-align: right">20 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">129.51 M</td>
    <td style="white-space: nowrap; text-align: right">7.72 ns</td>
    <td style="white-space: nowrap; text-align: right">±1957.32%</td>
    <td style="white-space: nowrap; text-align: right">5 ns</td>
    <td style="white-space: nowrap; text-align: right">38 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">49.60 M</td>
    <td style="white-space: nowrap; text-align: right">20.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±3255.08%</td>
    <td style="white-space: nowrap; text-align: right">16 ns</td>
    <td style="white-space: nowrap; text-align: right">91 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">17.65 M</td>
    <td style="white-space: nowrap; text-align: right">56.65 ns</td>
    <td style="white-space: nowrap; text-align: right">±35.54%</td>
    <td style="white-space: nowrap; text-align: right">57 ns</td>
    <td style="white-space: nowrap; text-align: right">91 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">12.11 M</td>
    <td style="white-space: nowrap; text-align: right">82.60 ns</td>
    <td style="white-space: nowrap; text-align: right">±29.73%</td>
    <td style="white-space: nowrap; text-align: right">81 ns</td>
    <td style="white-space: nowrap; text-align: right">123.46 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">11.68 M</td>
    <td style="white-space: nowrap; text-align: right">85.65 ns</td>
    <td style="white-space: nowrap; text-align: right">±35.12%</td>
    <td style="white-space: nowrap; text-align: right">83 ns</td>
    <td style="white-space: nowrap; text-align: right">131 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.80 M</td>
    <td style="white-space: nowrap; text-align: right">146.97 ns</td>
    <td style="white-space: nowrap; text-align: right">±27.96%</td>
    <td style="white-space: nowrap; text-align: right">143 ns</td>
    <td style="white-space: nowrap; text-align: right">186 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">4.65 M</td>
    <td style="white-space: nowrap; text-align: right">215.21 ns</td>
    <td style="white-space: nowrap; text-align: right">±37.45%</td>
    <td style="white-space: nowrap; text-align: right">210 ns</td>
    <td style="white-space: nowrap; text-align: right">350 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">4.40 M</td>
    <td style="white-space: nowrap; text-align: right">227.36 ns</td>
    <td style="white-space: nowrap; text-align: right">±54.65%</td>
    <td style="white-space: nowrap; text-align: right">217 ns</td>
    <td style="white-space: nowrap; text-align: right">459 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">1.39 M</td>
    <td style="white-space: nowrap; text-align: right">718.28 ns</td>
    <td style="white-space: nowrap; text-align: right">±8.91%</td>
    <td style="white-space: nowrap; text-align: right">711 ns</td>
    <td style="white-space: nowrap; text-align: right">951 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap;text-align: right">158.13 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">129.51 M</td>
    <td style="white-space: nowrap; text-align: right">1.22x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">49.60 M</td>
    <td style="white-space: nowrap; text-align: right">3.19x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">17.65 M</td>
    <td style="white-space: nowrap; text-align: right">8.96x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">12.11 M</td>
    <td style="white-space: nowrap; text-align: right">13.06x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">11.68 M</td>
    <td style="white-space: nowrap; text-align: right">13.54x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.80 M</td>
    <td style="white-space: nowrap; text-align: right">23.24x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">4.65 M</td>
    <td style="white-space: nowrap; text-align: right">34.03x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">4.40 M</td>
    <td style="white-space: nowrap; text-align: right">35.95x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">1.39 M</td>
    <td style="white-space: nowrap; text-align: right">113.58x</td>
  </tr>
</table>


<hr/>

### set(0, 0)

Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">29.05 M</td>
    <td style="white-space: nowrap; text-align: right">34.43 ns</td>
    <td style="white-space: nowrap; text-align: right">±59.10%</td>
    <td style="white-space: nowrap; text-align: right">32 ns</td>
    <td style="white-space: nowrap; text-align: right">92 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">27.84 M</td>
    <td style="white-space: nowrap; text-align: right">35.92 ns</td>
    <td style="white-space: nowrap; text-align: right">±2567.72%</td>
    <td style="white-space: nowrap; text-align: right">29 ns</td>
    <td style="white-space: nowrap; text-align: right">65 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">15.26 M</td>
    <td style="white-space: nowrap; text-align: right">65.51 ns</td>
    <td style="white-space: nowrap; text-align: right">±3146.44%</td>
    <td style="white-space: nowrap; text-align: right">56 ns</td>
    <td style="white-space: nowrap; text-align: right">92 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">12.67 M</td>
    <td style="white-space: nowrap; text-align: right">78.92 ns</td>
    <td style="white-space: nowrap; text-align: right">±5647.15%</td>
    <td style="white-space: nowrap; text-align: right">42 ns</td>
    <td style="white-space: nowrap; text-align: right">111 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">12.52 M</td>
    <td style="white-space: nowrap; text-align: right">79.89 ns</td>
    <td style="white-space: nowrap; text-align: right">±376.33%</td>
    <td style="white-space: nowrap; text-align: right">75 ns</td>
    <td style="white-space: nowrap; text-align: right">126 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">11.48 M</td>
    <td style="white-space: nowrap; text-align: right">87.10 ns</td>
    <td style="white-space: nowrap; text-align: right">±528.01%</td>
    <td style="white-space: nowrap; text-align: right">72 ns</td>
    <td style="white-space: nowrap; text-align: right">208 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.45 M</td>
    <td style="white-space: nowrap; text-align: right">95.73 ns</td>
    <td style="white-space: nowrap; text-align: right">±19.50%</td>
    <td style="white-space: nowrap; text-align: right">92 ns</td>
    <td style="white-space: nowrap; text-align: right">134 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.46 M</td>
    <td style="white-space: nowrap; text-align: right">118.18 ns</td>
    <td style="white-space: nowrap; text-align: right">±31.87%</td>
    <td style="white-space: nowrap; text-align: right">115 ns</td>
    <td style="white-space: nowrap; text-align: right">178 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.91 M</td>
    <td style="white-space: nowrap; text-align: right">169.23 ns</td>
    <td style="white-space: nowrap; text-align: right">±27.54%</td>
    <td style="white-space: nowrap; text-align: right">164 ns</td>
    <td style="white-space: nowrap; text-align: right">296 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.53 M</td>
    <td style="white-space: nowrap; text-align: right">220.62 ns</td>
    <td style="white-space: nowrap; text-align: right">±310.68%</td>
    <td style="white-space: nowrap; text-align: right">199 ns</td>
    <td style="white-space: nowrap; text-align: right">484.90 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap;text-align: right">29.05 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">27.84 M</td>
    <td style="white-space: nowrap; text-align: right">1.04x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">15.26 M</td>
    <td style="white-space: nowrap; text-align: right">1.9x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">12.67 M</td>
    <td style="white-space: nowrap; text-align: right">2.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">12.52 M</td>
    <td style="white-space: nowrap; text-align: right">2.32x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">11.48 M</td>
    <td style="white-space: nowrap; text-align: right">2.53x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.45 M</td>
    <td style="white-space: nowrap; text-align: right">2.78x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.46 M</td>
    <td style="white-space: nowrap; text-align: right">3.43x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.91 M</td>
    <td style="white-space: nowrap; text-align: right">4.92x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.53 M</td>
    <td style="white-space: nowrap; text-align: right">6.41x</td>
  </tr>
</table>


<hr/>

### set(4, 4)

Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">33.32 M</td>
    <td style="white-space: nowrap; text-align: right">30.01 ns</td>
    <td style="white-space: nowrap; text-align: right">±3895.53%</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
    <td style="white-space: nowrap; text-align: right">61 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.49 M</td>
    <td style="white-space: nowrap; text-align: right">60.66 ns</td>
    <td style="white-space: nowrap; text-align: right">±3246.66%</td>
    <td style="white-space: nowrap; text-align: right">49 ns</td>
    <td style="white-space: nowrap; text-align: right">98 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">13.76 M</td>
    <td style="white-space: nowrap; text-align: right">72.65 ns</td>
    <td style="white-space: nowrap; text-align: right">±6228.76%</td>
    <td style="white-space: nowrap; text-align: right">37 ns</td>
    <td style="white-space: nowrap; text-align: right">114 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.74 M</td>
    <td style="white-space: nowrap; text-align: right">102.68 ns</td>
    <td style="white-space: nowrap; text-align: right">±36.99%</td>
    <td style="white-space: nowrap; text-align: right">97 ns</td>
    <td style="white-space: nowrap; text-align: right">150 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.29 M</td>
    <td style="white-space: nowrap; text-align: right">107.62 ns</td>
    <td style="white-space: nowrap; text-align: right">±22.42%</td>
    <td style="white-space: nowrap; text-align: right">105 ns</td>
    <td style="white-space: nowrap; text-align: right">162 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.65 M</td>
    <td style="white-space: nowrap; text-align: right">176.99 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.85%</td>
    <td style="white-space: nowrap; text-align: right">170 ns</td>
    <td style="white-space: nowrap; text-align: right">254.70 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">5.44 M</td>
    <td style="white-space: nowrap; text-align: right">183.76 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.72%</td>
    <td style="white-space: nowrap; text-align: right">177 ns</td>
    <td style="white-space: nowrap; text-align: right">407 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.15 M</td>
    <td style="white-space: nowrap; text-align: right">241.02 ns</td>
    <td style="white-space: nowrap; text-align: right">±270.60%</td>
    <td style="white-space: nowrap; text-align: right">220 ns</td>
    <td style="white-space: nowrap; text-align: right">510 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">2.88 M</td>
    <td style="white-space: nowrap; text-align: right">346.96 ns</td>
    <td style="white-space: nowrap; text-align: right">±88.92%</td>
    <td style="white-space: nowrap; text-align: right">339 ns</td>
    <td style="white-space: nowrap; text-align: right">414 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">2.68 M</td>
    <td style="white-space: nowrap; text-align: right">372.47 ns</td>
    <td style="white-space: nowrap; text-align: right">±85.25%</td>
    <td style="white-space: nowrap; text-align: right">359 ns</td>
    <td style="white-space: nowrap; text-align: right">609 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap;text-align: right">33.32 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.49 M</td>
    <td style="white-space: nowrap; text-align: right">2.02x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">13.76 M</td>
    <td style="white-space: nowrap; text-align: right">2.42x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.74 M</td>
    <td style="white-space: nowrap; text-align: right">3.42x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.29 M</td>
    <td style="white-space: nowrap; text-align: right">3.59x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.65 M</td>
    <td style="white-space: nowrap; text-align: right">5.9x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">5.44 M</td>
    <td style="white-space: nowrap; text-align: right">6.12x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.15 M</td>
    <td style="white-space: nowrap; text-align: right">8.03x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">2.88 M</td>
    <td style="white-space: nowrap; text-align: right">11.56x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">2.68 M</td>
    <td style="white-space: nowrap; text-align: right">12.41x</td>
  </tr>
</table>


<hr/>

### set(8, 8)

Run Time
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap; text-align: right">21.23 M</td>
    <td style="white-space: nowrap; text-align: right">47.11 ns</td>
    <td style="white-space: nowrap; text-align: right">±9122.58%</td>
    <td style="white-space: nowrap; text-align: right">35 ns</td>
    <td style="white-space: nowrap; text-align: right">66 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">13.75 M</td>
    <td style="white-space: nowrap; text-align: right">72.72 ns</td>
    <td style="white-space: nowrap; text-align: right">±3726.93%</td>
    <td style="white-space: nowrap; text-align: right">61 ns</td>
    <td style="white-space: nowrap; text-align: right">77 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">9.98 M</td>
    <td style="white-space: nowrap; text-align: right">100.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±9312.11%</td>
    <td style="white-space: nowrap; text-align: right">47 ns</td>
    <td style="white-space: nowrap; text-align: right">128 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.84 M</td>
    <td style="white-space: nowrap; text-align: right">113.12 ns</td>
    <td style="white-space: nowrap; text-align: right">±13.41%</td>
    <td style="white-space: nowrap; text-align: right">108 ns</td>
    <td style="white-space: nowrap; text-align: right">153 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.40 M</td>
    <td style="white-space: nowrap; text-align: right">119.03 ns</td>
    <td style="white-space: nowrap; text-align: right">±21.77%</td>
    <td style="white-space: nowrap; text-align: right">112 ns</td>
    <td style="white-space: nowrap; text-align: right">179 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.58 M</td>
    <td style="white-space: nowrap; text-align: right">179.07 ns</td>
    <td style="white-space: nowrap; text-align: right">±27.94%</td>
    <td style="white-space: nowrap; text-align: right">174 ns</td>
    <td style="white-space: nowrap; text-align: right">226 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.85 M</td>
    <td style="white-space: nowrap; text-align: right">259.90 ns</td>
    <td style="white-space: nowrap; text-align: right">±241.14%</td>
    <td style="white-space: nowrap; text-align: right">238 ns</td>
    <td style="white-space: nowrap; text-align: right">523 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">3.08 M</td>
    <td style="white-space: nowrap; text-align: right">324.75 ns</td>
    <td style="white-space: nowrap; text-align: right">±73.05%</td>
    <td style="white-space: nowrap; text-align: right">312 ns</td>
    <td style="white-space: nowrap; text-align: right">558 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">2.71 M</td>
    <td style="white-space: nowrap; text-align: right">368.62 ns</td>
    <td style="white-space: nowrap; text-align: right">±65.68%</td>
    <td style="white-space: nowrap; text-align: right">348 ns</td>
    <td style="white-space: nowrap; text-align: right">1462 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">1.36 M</td>
    <td style="white-space: nowrap; text-align: right">734.08 ns</td>
    <td style="white-space: nowrap; text-align: right">±159.21%</td>
    <td style="white-space: nowrap; text-align: right">687 ns</td>
    <td style="white-space: nowrap; text-align: right">1351.83 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTuple</td>
    <td style="white-space: nowrap;text-align: right">21.23 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">13.75 M</td>
    <td style="white-space: nowrap; text-align: right">1.54x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">9.98 M</td>
    <td style="white-space: nowrap; text-align: right">2.13x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.84 M</td>
    <td style="white-space: nowrap; text-align: right">2.4x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.40 M</td>
    <td style="white-space: nowrap; text-align: right">2.53x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.58 M</td>
    <td style="white-space: nowrap; text-align: right">3.8x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.85 M</td>
    <td style="white-space: nowrap; text-align: right">5.52x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List2D</td>
    <td style="white-space: nowrap; text-align: right">3.08 M</td>
    <td style="white-space: nowrap; text-align: right">6.89x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">2.71 M</td>
    <td style="white-space: nowrap; text-align: right">7.82x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Elixir.Board.List1D</td>
    <td style="white-space: nowrap; text-align: right">1.36 M</td>
    <td style="white-space: nowrap; text-align: right">15.58x</td>
  </tr>
</table>


<hr/>
