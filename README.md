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
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">132.36 K</td>
    <td style="white-space: nowrap; text-align: right">7.56 μs</td>
    <td style="white-space: nowrap; text-align: right">±36.11%</td>
    <td style="white-space: nowrap; text-align: right">6.97 μs</td>
    <td style="white-space: nowrap; text-align: right">13.11 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">127.43 K</td>
    <td style="white-space: nowrap; text-align: right">7.85 μs</td>
    <td style="white-space: nowrap; text-align: right">±37.17%</td>
    <td style="white-space: nowrap; text-align: right">7.52 μs</td>
    <td style="white-space: nowrap; text-align: right">12.26 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">125.80 K</td>
    <td style="white-space: nowrap; text-align: right">7.95 μs</td>
    <td style="white-space: nowrap; text-align: right">±25.99%</td>
    <td style="white-space: nowrap; text-align: right">7.65 μs</td>
    <td style="white-space: nowrap; text-align: right">16.09 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">60.29 K</td>
    <td style="white-space: nowrap; text-align: right">16.59 μs</td>
    <td style="white-space: nowrap; text-align: right">±9.51%</td>
    <td style="white-space: nowrap; text-align: right">16.08 μs</td>
    <td style="white-space: nowrap; text-align: right">20.35 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">56.39 K</td>
    <td style="white-space: nowrap; text-align: right">17.73 μs</td>
    <td style="white-space: nowrap; text-align: right">±12.91%</td>
    <td style="white-space: nowrap; text-align: right">16.83 μs</td>
    <td style="white-space: nowrap; text-align: right">23.31 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">39.57 K</td>
    <td style="white-space: nowrap; text-align: right">25.27 μs</td>
    <td style="white-space: nowrap; text-align: right">±9.41%</td>
    <td style="white-space: nowrap; text-align: right">24.73 μs</td>
    <td style="white-space: nowrap; text-align: right">28.80 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">36.06 K</td>
    <td style="white-space: nowrap; text-align: right">27.73 μs</td>
    <td style="white-space: nowrap; text-align: right">±8.82%</td>
    <td style="white-space: nowrap; text-align: right">27.80 μs</td>
    <td style="white-space: nowrap; text-align: right">33.05 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">29.36 K</td>
    <td style="white-space: nowrap; text-align: right">34.06 μs</td>
    <td style="white-space: nowrap; text-align: right">±4.37%</td>
    <td style="white-space: nowrap; text-align: right">33.66 μs</td>
    <td style="white-space: nowrap; text-align: right">37.39 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">24.61 K</td>
    <td style="white-space: nowrap; text-align: right">40.63 μs</td>
    <td style="white-space: nowrap; text-align: right">±2.94%</td>
    <td style="white-space: nowrap; text-align: right">40.69 μs</td>
    <td style="white-space: nowrap; text-align: right">43.84 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">15.14 K</td>
    <td style="white-space: nowrap; text-align: right">66.06 μs</td>
    <td style="white-space: nowrap; text-align: right">±3.10%</td>
    <td style="white-space: nowrap; text-align: right">65.80 μs</td>
    <td style="white-space: nowrap; text-align: right">71.16 μs</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap;text-align: right">132.36 K</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">127.43 K</td>
    <td style="white-space: nowrap; text-align: right">1.04x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">125.80 K</td>
    <td style="white-space: nowrap; text-align: right">1.05x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">60.29 K</td>
    <td style="white-space: nowrap; text-align: right">2.2x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">56.39 K</td>
    <td style="white-space: nowrap; text-align: right">2.35x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">39.57 K</td>
    <td style="white-space: nowrap; text-align: right">3.34x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">36.06 K</td>
    <td style="white-space: nowrap; text-align: right">3.67x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">29.36 K</td>
    <td style="white-space: nowrap; text-align: right">4.51x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">24.61 K</td>
    <td style="white-space: nowrap; text-align: right">5.38x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">15.14 K</td>
    <td style="white-space: nowrap; text-align: right">8.74x</td>
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
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap">54.91 KB</td>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap">18.51 KB</td>
    <td>0.34x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap">12.74 KB</td>
    <td>0.23x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap">11.55 KB</td>
    <td>0.21x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap">25.79 KB</td>
    <td>0.47x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap">11.55 KB</td>
    <td>0.21x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap">49.55 KB</td>
    <td>0.9x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap">22.60 KB</td>
    <td>0.41x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap">45.22 KB</td>
    <td>0.82x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
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
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">4.98 M</td>
    <td style="white-space: nowrap; text-align: right">200.94 ns</td>
    <td style="white-space: nowrap; text-align: right">±1059.71%</td>
    <td style="white-space: nowrap; text-align: right">170 ns</td>
    <td style="white-space: nowrap; text-align: right">331 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">4.89 M</td>
    <td style="white-space: nowrap; text-align: right">204.62 ns</td>
    <td style="white-space: nowrap; text-align: right">±1262.07%</td>
    <td style="white-space: nowrap; text-align: right">142 ns</td>
    <td style="white-space: nowrap; text-align: right">401 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">4.08 M</td>
    <td style="white-space: nowrap; text-align: right">245.26 ns</td>
    <td style="white-space: nowrap; text-align: right">±5145.19%</td>
    <td style="white-space: nowrap; text-align: right">192 ns</td>
    <td style="white-space: nowrap; text-align: right">290 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">1.89 M</td>
    <td style="white-space: nowrap; text-align: right">528.41 ns</td>
    <td style="white-space: nowrap; text-align: right">±9.44%</td>
    <td style="white-space: nowrap; text-align: right">519 ns</td>
    <td style="white-space: nowrap; text-align: right">658 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">1.80 M</td>
    <td style="white-space: nowrap; text-align: right">556.84 ns</td>
    <td style="white-space: nowrap; text-align: right">±32.26%</td>
    <td style="white-space: nowrap; text-align: right">526 ns</td>
    <td style="white-space: nowrap; text-align: right">1859.09 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">1.22 M</td>
    <td style="white-space: nowrap; text-align: right">818.20 ns</td>
    <td style="white-space: nowrap; text-align: right">±75.37%</td>
    <td style="white-space: nowrap; text-align: right">767 ns</td>
    <td style="white-space: nowrap; text-align: right">2800 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">1.08 M</td>
    <td style="white-space: nowrap; text-align: right">924.57 ns</td>
    <td style="white-space: nowrap; text-align: right">±24.11%</td>
    <td style="white-space: nowrap; text-align: right">885 ns</td>
    <td style="white-space: nowrap; text-align: right">2154.45 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">0.88 M</td>
    <td style="white-space: nowrap; text-align: right">1131.48 ns</td>
    <td style="white-space: nowrap; text-align: right">±45.29%</td>
    <td style="white-space: nowrap; text-align: right">1064 ns</td>
    <td style="white-space: nowrap; text-align: right">3115.64 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">0.81 M</td>
    <td style="white-space: nowrap; text-align: right">1235.25 ns</td>
    <td style="white-space: nowrap; text-align: right">±58.48%</td>
    <td style="white-space: nowrap; text-align: right">1194 ns</td>
    <td style="white-space: nowrap; text-align: right">2421.24 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">0.44 M</td>
    <td style="white-space: nowrap; text-align: right">2252.39 ns</td>
    <td style="white-space: nowrap; text-align: right">±32.61%</td>
    <td style="white-space: nowrap; text-align: right">2160 ns</td>
    <td style="white-space: nowrap; text-align: right">3432 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap;text-align: right">4.98 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">4.89 M</td>
    <td style="white-space: nowrap; text-align: right">1.02x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">4.08 M</td>
    <td style="white-space: nowrap; text-align: right">1.22x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">1.89 M</td>
    <td style="white-space: nowrap; text-align: right">2.63x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">1.80 M</td>
    <td style="white-space: nowrap; text-align: right">2.77x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">1.22 M</td>
    <td style="white-space: nowrap; text-align: right">4.07x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">1.08 M</td>
    <td style="white-space: nowrap; text-align: right">4.6x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">0.88 M</td>
    <td style="white-space: nowrap; text-align: right">5.63x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">0.81 M</td>
    <td style="white-space: nowrap; text-align: right">6.15x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">0.44 M</td>
    <td style="white-space: nowrap; text-align: right">11.21x</td>
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
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap">512 B</td>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap">1344 B</td>
    <td>2.63x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap">368 B</td>
    <td>0.72x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap">400 B</td>
    <td>0.78x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap">248 B</td>
    <td>0.48x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap">1712 B</td>
    <td>3.34x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap">248 B</td>
    <td>0.48x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap">656 B</td>
    <td>1.28x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap">1504 B</td>
    <td>2.94x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap">2048 B</td>
    <td>4.0x</td>
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
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">49.18 M</td>
    <td style="white-space: nowrap; text-align: right">20.33 ns</td>
    <td style="white-space: nowrap; text-align: right">±734.76%</td>
    <td style="white-space: nowrap; text-align: right">18 ns</td>
    <td style="white-space: nowrap; text-align: right">34 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">42.15 M</td>
    <td style="white-space: nowrap; text-align: right">23.73 ns</td>
    <td style="white-space: nowrap; text-align: right">±7257.42%</td>
    <td style="white-space: nowrap; text-align: right">19 ns</td>
    <td style="white-space: nowrap; text-align: right">36 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">30.97 M</td>
    <td style="white-space: nowrap; text-align: right">32.28 ns</td>
    <td style="white-space: nowrap; text-align: right">±1611.81%</td>
    <td style="white-space: nowrap; text-align: right">30 ns</td>
    <td style="white-space: nowrap; text-align: right">53 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">22.18 M</td>
    <td style="white-space: nowrap; text-align: right">45.08 ns</td>
    <td style="white-space: nowrap; text-align: right">±52.14%</td>
    <td style="white-space: nowrap; text-align: right">42 ns</td>
    <td style="white-space: nowrap; text-align: right">99 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">19.51 M</td>
    <td style="white-space: nowrap; text-align: right">51.25 ns</td>
    <td style="white-space: nowrap; text-align: right">±74.59%</td>
    <td style="white-space: nowrap; text-align: right">47 ns</td>
    <td style="white-space: nowrap; text-align: right">94 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">16.56 M</td>
    <td style="white-space: nowrap; text-align: right">60.39 ns</td>
    <td style="white-space: nowrap; text-align: right">±34.66%</td>
    <td style="white-space: nowrap; text-align: right">56 ns</td>
    <td style="white-space: nowrap; text-align: right">100 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">10.98 M</td>
    <td style="white-space: nowrap; text-align: right">91.08 ns</td>
    <td style="white-space: nowrap; text-align: right">±92.11%</td>
    <td style="white-space: nowrap; text-align: right">85 ns</td>
    <td style="white-space: nowrap; text-align: right">199 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.66 M</td>
    <td style="white-space: nowrap; text-align: right">93.84 ns</td>
    <td style="white-space: nowrap; text-align: right">±22.28%</td>
    <td style="white-space: nowrap; text-align: right">88 ns</td>
    <td style="white-space: nowrap; text-align: right">135 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">10.19 M</td>
    <td style="white-space: nowrap; text-align: right">98.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±15.62%</td>
    <td style="white-space: nowrap; text-align: right">96 ns</td>
    <td style="white-space: nowrap; text-align: right">146 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.12 M</td>
    <td style="white-space: nowrap; text-align: right">163.49 ns</td>
    <td style="white-space: nowrap; text-align: right">±29.68%</td>
    <td style="white-space: nowrap; text-align: right">157 ns</td>
    <td style="white-space: nowrap; text-align: right">289 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap;text-align: right">49.18 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">42.15 M</td>
    <td style="white-space: nowrap; text-align: right">1.17x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">30.97 M</td>
    <td style="white-space: nowrap; text-align: right">1.59x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">22.18 M</td>
    <td style="white-space: nowrap; text-align: right">2.22x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">19.51 M</td>
    <td style="white-space: nowrap; text-align: right">2.52x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">16.56 M</td>
    <td style="white-space: nowrap; text-align: right">2.97x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">10.98 M</td>
    <td style="white-space: nowrap; text-align: right">4.48x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.66 M</td>
    <td style="white-space: nowrap; text-align: right">4.61x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">10.19 M</td>
    <td style="white-space: nowrap; text-align: right">4.83x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.12 M</td>
    <td style="white-space: nowrap; text-align: right">8.04x</td>
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
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">54.88 M</td>
    <td style="white-space: nowrap; text-align: right">18.22 ns</td>
    <td style="white-space: nowrap; text-align: right">±904.14%</td>
    <td style="white-space: nowrap; text-align: right">16 ns</td>
    <td style="white-space: nowrap; text-align: right">33 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">52.51 M</td>
    <td style="white-space: nowrap; text-align: right">19.04 ns</td>
    <td style="white-space: nowrap; text-align: right">±1169.22%</td>
    <td style="white-space: nowrap; text-align: right">16 ns</td>
    <td style="white-space: nowrap; text-align: right">32 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">36.10 M</td>
    <td style="white-space: nowrap; text-align: right">27.70 ns</td>
    <td style="white-space: nowrap; text-align: right">±1940.68%</td>
    <td style="white-space: nowrap; text-align: right">25 ns</td>
    <td style="white-space: nowrap; text-align: right">41 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">16.77 M</td>
    <td style="white-space: nowrap; text-align: right">59.64 ns</td>
    <td style="white-space: nowrap; text-align: right">±31.01%</td>
    <td style="white-space: nowrap; text-align: right">55 ns</td>
    <td style="white-space: nowrap; text-align: right">102 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">11.20 M</td>
    <td style="white-space: nowrap; text-align: right">89.27 ns</td>
    <td style="white-space: nowrap; text-align: right">±38.55%</td>
    <td style="white-space: nowrap; text-align: right">85 ns</td>
    <td style="white-space: nowrap; text-align: right">129 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.69 M</td>
    <td style="white-space: nowrap; text-align: right">103.21 ns</td>
    <td style="white-space: nowrap; text-align: right">±121.34%</td>
    <td style="white-space: nowrap; text-align: right">99 ns</td>
    <td style="white-space: nowrap; text-align: right">142 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">6.20 M</td>
    <td style="white-space: nowrap; text-align: right">161.23 ns</td>
    <td style="white-space: nowrap; text-align: right">±55.20%</td>
    <td style="white-space: nowrap; text-align: right">153 ns</td>
    <td style="white-space: nowrap; text-align: right">295.79 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.91 M</td>
    <td style="white-space: nowrap; text-align: right">169.34 ns</td>
    <td style="white-space: nowrap; text-align: right">±21.22%</td>
    <td style="white-space: nowrap; text-align: right">166 ns</td>
    <td style="white-space: nowrap; text-align: right">236.44 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">4.48 M</td>
    <td style="white-space: nowrap; text-align: right">223.22 ns</td>
    <td style="white-space: nowrap; text-align: right">±22.58%</td>
    <td style="white-space: nowrap; text-align: right">219 ns</td>
    <td style="white-space: nowrap; text-align: right">272 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.59 M</td>
    <td style="white-space: nowrap; text-align: right">386.43 ns</td>
    <td style="white-space: nowrap; text-align: right">±9.93%</td>
    <td style="white-space: nowrap; text-align: right">380 ns</td>
    <td style="white-space: nowrap; text-align: right">612 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap;text-align: right">54.88 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">52.51 M</td>
    <td style="white-space: nowrap; text-align: right">1.05x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">36.10 M</td>
    <td style="white-space: nowrap; text-align: right">1.52x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">16.77 M</td>
    <td style="white-space: nowrap; text-align: right">3.27x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">11.20 M</td>
    <td style="white-space: nowrap; text-align: right">4.9x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.69 M</td>
    <td style="white-space: nowrap; text-align: right">5.66x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">6.20 M</td>
    <td style="white-space: nowrap; text-align: right">8.85x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.91 M</td>
    <td style="white-space: nowrap; text-align: right">9.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">4.48 M</td>
    <td style="white-space: nowrap; text-align: right">12.25x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.59 M</td>
    <td style="white-space: nowrap; text-align: right">21.21x</td>
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
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">70.54 M</td>
    <td style="white-space: nowrap; text-align: right">14.18 ns</td>
    <td style="white-space: nowrap; text-align: right">±1501.52%</td>
    <td style="white-space: nowrap; text-align: right">11 ns</td>
    <td style="white-space: nowrap; text-align: right">34 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">68.98 M</td>
    <td style="white-space: nowrap; text-align: right">14.50 ns</td>
    <td style="white-space: nowrap; text-align: right">±1040.51%</td>
    <td style="white-space: nowrap; text-align: right">13 ns</td>
    <td style="white-space: nowrap; text-align: right">27 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">37.51 M</td>
    <td style="white-space: nowrap; text-align: right">26.66 ns</td>
    <td style="white-space: nowrap; text-align: right">±3568.55%</td>
    <td style="white-space: nowrap; text-align: right">23 ns</td>
    <td style="white-space: nowrap; text-align: right">47 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">16.57 M</td>
    <td style="white-space: nowrap; text-align: right">60.33 ns</td>
    <td style="white-space: nowrap; text-align: right">±32.37%</td>
    <td style="white-space: nowrap; text-align: right">59 ns</td>
    <td style="white-space: nowrap; text-align: right">98 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">11.08 M</td>
    <td style="white-space: nowrap; text-align: right">90.22 ns</td>
    <td style="white-space: nowrap; text-align: right">±23.38%</td>
    <td style="white-space: nowrap; text-align: right">84 ns</td>
    <td style="white-space: nowrap; text-align: right">136 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">10.60 M</td>
    <td style="white-space: nowrap; text-align: right">94.33 ns</td>
    <td style="white-space: nowrap; text-align: right">±27.47%</td>
    <td style="white-space: nowrap; text-align: right">91 ns</td>
    <td style="white-space: nowrap; text-align: right">134 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.02 M</td>
    <td style="white-space: nowrap; text-align: right">166.20 ns</td>
    <td style="white-space: nowrap; text-align: right">±58.99%</td>
    <td style="white-space: nowrap; text-align: right">161 ns</td>
    <td style="white-space: nowrap; text-align: right">203 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">4.65 M</td>
    <td style="white-space: nowrap; text-align: right">215.24 ns</td>
    <td style="white-space: nowrap; text-align: right">±18.43%</td>
    <td style="white-space: nowrap; text-align: right">212 ns</td>
    <td style="white-space: nowrap; text-align: right">266 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">4.25 M</td>
    <td style="white-space: nowrap; text-align: right">235.23 ns</td>
    <td style="white-space: nowrap; text-align: right">±37.39%</td>
    <td style="white-space: nowrap; text-align: right">228 ns</td>
    <td style="white-space: nowrap; text-align: right">460 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.40 M</td>
    <td style="white-space: nowrap; text-align: right">712.88 ns</td>
    <td style="white-space: nowrap; text-align: right">±11.02%</td>
    <td style="white-space: nowrap; text-align: right">697 ns</td>
    <td style="white-space: nowrap; text-align: right">945 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap;text-align: right">70.54 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">68.98 M</td>
    <td style="white-space: nowrap; text-align: right">1.02x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">37.51 M</td>
    <td style="white-space: nowrap; text-align: right">1.88x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">16.57 M</td>
    <td style="white-space: nowrap; text-align: right">4.26x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">11.08 M</td>
    <td style="white-space: nowrap; text-align: right">6.36x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">10.60 M</td>
    <td style="white-space: nowrap; text-align: right">6.65x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.02 M</td>
    <td style="white-space: nowrap; text-align: right">11.72x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">4.65 M</td>
    <td style="white-space: nowrap; text-align: right">15.18x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">4.25 M</td>
    <td style="white-space: nowrap; text-align: right">16.59x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.40 M</td>
    <td style="white-space: nowrap; text-align: right">50.29x</td>
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
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">42.65 M</td>
    <td style="white-space: nowrap; text-align: right">23.45 ns</td>
    <td style="white-space: nowrap; text-align: right">±78.77%</td>
    <td style="white-space: nowrap; text-align: right">20 ns</td>
    <td style="white-space: nowrap; text-align: right">67 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">21.62 M</td>
    <td style="white-space: nowrap; text-align: right">46.24 ns</td>
    <td style="white-space: nowrap; text-align: right">±19395.85%</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
    <td style="white-space: nowrap; text-align: right">55 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">18.05 M</td>
    <td style="white-space: nowrap; text-align: right">55.42 ns</td>
    <td style="white-space: nowrap; text-align: right">±2317.03%</td>
    <td style="white-space: nowrap; text-align: right">44 ns</td>
    <td style="white-space: nowrap; text-align: right">75 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">13.33 M</td>
    <td style="white-space: nowrap; text-align: right">75.02 ns</td>
    <td style="white-space: nowrap; text-align: right">±7062.47%</td>
    <td style="white-space: nowrap; text-align: right">35 ns</td>
    <td style="white-space: nowrap; text-align: right">86 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">13.15 M</td>
    <td style="white-space: nowrap; text-align: right">76.05 ns</td>
    <td style="white-space: nowrap; text-align: right">±455.77%</td>
    <td style="white-space: nowrap; text-align: right">70 ns</td>
    <td style="white-space: nowrap; text-align: right">116 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">11.86 M</td>
    <td style="white-space: nowrap; text-align: right">84.30 ns</td>
    <td style="white-space: nowrap; text-align: right">±546.34%</td>
    <td style="white-space: nowrap; text-align: right">70 ns</td>
    <td style="white-space: nowrap; text-align: right">200 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.38 M</td>
    <td style="white-space: nowrap; text-align: right">106.58 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.16%</td>
    <td style="white-space: nowrap; text-align: right">104 ns</td>
    <td style="white-space: nowrap; text-align: right">146 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.58 M</td>
    <td style="white-space: nowrap; text-align: right">116.54 ns</td>
    <td style="white-space: nowrap; text-align: right">±20.58%</td>
    <td style="white-space: nowrap; text-align: right">112 ns</td>
    <td style="white-space: nowrap; text-align: right">164 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.05 M</td>
    <td style="white-space: nowrap; text-align: right">165.20 ns</td>
    <td style="white-space: nowrap; text-align: right">±59.88%</td>
    <td style="white-space: nowrap; text-align: right">159 ns</td>
    <td style="white-space: nowrap; text-align: right">296 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.33 M</td>
    <td style="white-space: nowrap; text-align: right">230.88 ns</td>
    <td style="white-space: nowrap; text-align: right">±122.79%</td>
    <td style="white-space: nowrap; text-align: right">206 ns</td>
    <td style="white-space: nowrap; text-align: right">499 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap;text-align: right">42.65 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">21.62 M</td>
    <td style="white-space: nowrap; text-align: right">1.97x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">18.05 M</td>
    <td style="white-space: nowrap; text-align: right">2.36x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">13.33 M</td>
    <td style="white-space: nowrap; text-align: right">3.2x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">13.15 M</td>
    <td style="white-space: nowrap; text-align: right">3.24x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">11.86 M</td>
    <td style="white-space: nowrap; text-align: right">3.6x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.38 M</td>
    <td style="white-space: nowrap; text-align: right">4.55x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.58 M</td>
    <td style="white-space: nowrap; text-align: right">4.97x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.05 M</td>
    <td style="white-space: nowrap; text-align: right">7.05x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.33 M</td>
    <td style="white-space: nowrap; text-align: right">9.85x</td>
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
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">27.01 M</td>
    <td style="white-space: nowrap; text-align: right">37.02 ns</td>
    <td style="white-space: nowrap; text-align: right">±6159.06%</td>
    <td style="white-space: nowrap; text-align: right">28 ns</td>
    <td style="white-space: nowrap; text-align: right">68 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.96 M</td>
    <td style="white-space: nowrap; text-align: right">58.97 ns</td>
    <td style="white-space: nowrap; text-align: right">±2609.67%</td>
    <td style="white-space: nowrap; text-align: right">48 ns</td>
    <td style="white-space: nowrap; text-align: right">81 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">12.47 M</td>
    <td style="white-space: nowrap; text-align: right">80.19 ns</td>
    <td style="white-space: nowrap; text-align: right">±5890.95%</td>
    <td style="white-space: nowrap; text-align: right">40 ns</td>
    <td style="white-space: nowrap; text-align: right">119 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.80 M</td>
    <td style="white-space: nowrap; text-align: right">113.61 ns</td>
    <td style="white-space: nowrap; text-align: right">±18.73%</td>
    <td style="white-space: nowrap; text-align: right">110 ns</td>
    <td style="white-space: nowrap; text-align: right">164.30 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.74 M</td>
    <td style="white-space: nowrap; text-align: right">114.39 ns</td>
    <td style="white-space: nowrap; text-align: right">±24.31%</td>
    <td style="white-space: nowrap; text-align: right">109 ns</td>
    <td style="white-space: nowrap; text-align: right">250 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.60 M</td>
    <td style="white-space: nowrap; text-align: right">178.57 ns</td>
    <td style="white-space: nowrap; text-align: right">±17.58%</td>
    <td style="white-space: nowrap; text-align: right">175 ns</td>
    <td style="white-space: nowrap; text-align: right">223 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">5.00 M</td>
    <td style="white-space: nowrap; text-align: right">199.90 ns</td>
    <td style="white-space: nowrap; text-align: right">±108.04%</td>
    <td style="white-space: nowrap; text-align: right">192 ns</td>
    <td style="white-space: nowrap; text-align: right">416 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.86 M</td>
    <td style="white-space: nowrap; text-align: right">258.94 ns</td>
    <td style="white-space: nowrap; text-align: right">±108.92%</td>
    <td style="white-space: nowrap; text-align: right">232 ns</td>
    <td style="white-space: nowrap; text-align: right">524 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">2.86 M</td>
    <td style="white-space: nowrap; text-align: right">349.57 ns</td>
    <td style="white-space: nowrap; text-align: right">±84.68%</td>
    <td style="white-space: nowrap; text-align: right">343 ns</td>
    <td style="white-space: nowrap; text-align: right">407 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.70 M</td>
    <td style="white-space: nowrap; text-align: right">370.17 ns</td>
    <td style="white-space: nowrap; text-align: right">±351.12%</td>
    <td style="white-space: nowrap; text-align: right">352 ns</td>
    <td style="white-space: nowrap; text-align: right">605 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap;text-align: right">27.01 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.96 M</td>
    <td style="white-space: nowrap; text-align: right">1.59x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">12.47 M</td>
    <td style="white-space: nowrap; text-align: right">2.17x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.80 M</td>
    <td style="white-space: nowrap; text-align: right">3.07x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.74 M</td>
    <td style="white-space: nowrap; text-align: right">3.09x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.60 M</td>
    <td style="white-space: nowrap; text-align: right">4.82x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">5.00 M</td>
    <td style="white-space: nowrap; text-align: right">5.4x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.86 M</td>
    <td style="white-space: nowrap; text-align: right">6.99x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">2.86 M</td>
    <td style="white-space: nowrap; text-align: right">9.44x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.70 M</td>
    <td style="white-space: nowrap; text-align: right">10.0x</td>
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
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">24.41 M</td>
    <td style="white-space: nowrap; text-align: right">40.96 ns</td>
    <td style="white-space: nowrap; text-align: right">±5060.93%</td>
    <td style="white-space: nowrap; text-align: right">31 ns</td>
    <td style="white-space: nowrap; text-align: right">72 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">15.95 M</td>
    <td style="white-space: nowrap; text-align: right">62.70 ns</td>
    <td style="white-space: nowrap; text-align: right">±2149.23%</td>
    <td style="white-space: nowrap; text-align: right">52 ns</td>
    <td style="white-space: nowrap; text-align: right">73 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">10.68 M</td>
    <td style="white-space: nowrap; text-align: right">93.61 ns</td>
    <td style="white-space: nowrap; text-align: right">±8311.01%</td>
    <td style="white-space: nowrap; text-align: right">43 ns</td>
    <td style="white-space: nowrap; text-align: right">120 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.77 M</td>
    <td style="white-space: nowrap; text-align: right">113.98 ns</td>
    <td style="white-space: nowrap; text-align: right">±13.97%</td>
    <td style="white-space: nowrap; text-align: right">112 ns</td>
    <td style="white-space: nowrap; text-align: right">148 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.47 M</td>
    <td style="white-space: nowrap; text-align: right">118.03 ns</td>
    <td style="white-space: nowrap; text-align: right">±17.85%</td>
    <td style="white-space: nowrap; text-align: right">114 ns</td>
    <td style="white-space: nowrap; text-align: right">166 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.47 M</td>
    <td style="white-space: nowrap; text-align: right">182.88 ns</td>
    <td style="white-space: nowrap; text-align: right">±80.46%</td>
    <td style="white-space: nowrap; text-align: right">177 ns</td>
    <td style="white-space: nowrap; text-align: right">226 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.73 M</td>
    <td style="white-space: nowrap; text-align: right">267.76 ns</td>
    <td style="white-space: nowrap; text-align: right">±106.48%</td>
    <td style="white-space: nowrap; text-align: right">240 ns</td>
    <td style="white-space: nowrap; text-align: right">546 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">3.10 M</td>
    <td style="white-space: nowrap; text-align: right">322.24 ns</td>
    <td style="white-space: nowrap; text-align: right">±69.83%</td>
    <td style="white-space: nowrap; text-align: right">309 ns</td>
    <td style="white-space: nowrap; text-align: right">553 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">2.73 M</td>
    <td style="white-space: nowrap; text-align: right">366.94 ns</td>
    <td style="white-space: nowrap; text-align: right">±66.04%</td>
    <td style="white-space: nowrap; text-align: right">347 ns</td>
    <td style="white-space: nowrap; text-align: right">1449 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.40 M</td>
    <td style="white-space: nowrap; text-align: right">712.70 ns</td>
    <td style="white-space: nowrap; text-align: right">±157.98%</td>
    <td style="white-space: nowrap; text-align: right">663 ns</td>
    <td style="white-space: nowrap; text-align: right">1393 ns</td>
  </tr>
</table>

Comparison
<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap;text-align: right">24.41 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">15.95 M</td>
    <td style="white-space: nowrap; text-align: right">1.53x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">10.68 M</td>
    <td style="white-space: nowrap; text-align: right">2.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.77 M</td>
    <td style="white-space: nowrap; text-align: right">2.78x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.47 M</td>
    <td style="white-space: nowrap; text-align: right">2.88x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.47 M</td>
    <td style="white-space: nowrap; text-align: right">4.46x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.73 M</td>
    <td style="white-space: nowrap; text-align: right">6.54x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">3.10 M</td>
    <td style="white-space: nowrap; text-align: right">7.87x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">2.73 M</td>
    <td style="white-space: nowrap; text-align: right">8.96x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.40 M</td>
    <td style="white-space: nowrap; text-align: right">17.4x</td>
  </tr>
</table>


<hr/>