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
    <td style="white-space: nowrap; text-align: right">136.21 K</td>
    <td style="white-space: nowrap; text-align: right">7.34 μs</td>
    <td style="white-space: nowrap; text-align: right">±55.74%</td>
    <td style="white-space: nowrap; text-align: right">6.76 μs</td>
    <td style="white-space: nowrap; text-align: right">11.92 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">134.70 K</td>
    <td style="white-space: nowrap; text-align: right">7.42 μs</td>
    <td style="white-space: nowrap; text-align: right">±40.47%</td>
    <td style="white-space: nowrap; text-align: right">7.08 μs</td>
    <td style="white-space: nowrap; text-align: right">11.86 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">125.94 K</td>
    <td style="white-space: nowrap; text-align: right">7.94 μs</td>
    <td style="white-space: nowrap; text-align: right">±24.67%</td>
    <td style="white-space: nowrap; text-align: right">7.63 μs</td>
    <td style="white-space: nowrap; text-align: right">16.24 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">64.42 K</td>
    <td style="white-space: nowrap; text-align: right">15.52 μs</td>
    <td style="white-space: nowrap; text-align: right">±13.52%</td>
    <td style="white-space: nowrap; text-align: right">15.10 μs</td>
    <td style="white-space: nowrap; text-align: right">20.58 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">60.17 K</td>
    <td style="white-space: nowrap; text-align: right">16.62 μs</td>
    <td style="white-space: nowrap; text-align: right">±10.44%</td>
    <td style="white-space: nowrap; text-align: right">16.07 μs</td>
    <td style="white-space: nowrap; text-align: right">21.29 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">55.00 K</td>
    <td style="white-space: nowrap; text-align: right">18.18 μs</td>
    <td style="white-space: nowrap; text-align: right">±13.75%</td>
    <td style="white-space: nowrap; text-align: right">17.01 μs</td>
    <td style="white-space: nowrap; text-align: right">23.08 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">53.13 K</td>
    <td style="white-space: nowrap; text-align: right">18.82 μs</td>
    <td style="white-space: nowrap; text-align: right">±8.09%</td>
    <td style="white-space: nowrap; text-align: right">18.09 μs</td>
    <td style="white-space: nowrap; text-align: right">22.31 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">38.75 K</td>
    <td style="white-space: nowrap; text-align: right">25.81 μs</td>
    <td style="white-space: nowrap; text-align: right">±13.16%</td>
    <td style="white-space: nowrap; text-align: right">25.00 μs</td>
    <td style="white-space: nowrap; text-align: right">30.38 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">36.25 K</td>
    <td style="white-space: nowrap; text-align: right">27.58 μs</td>
    <td style="white-space: nowrap; text-align: right">±8.30%</td>
    <td style="white-space: nowrap; text-align: right">27.62 μs</td>
    <td style="white-space: nowrap; text-align: right">32.38 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">29.61 K</td>
    <td style="white-space: nowrap; text-align: right">33.77 μs</td>
    <td style="white-space: nowrap; text-align: right">±4.08%</td>
    <td style="white-space: nowrap; text-align: right">33.38 μs</td>
    <td style="white-space: nowrap; text-align: right">37.12 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">28.19 K</td>
    <td style="white-space: nowrap; text-align: right">35.47 μs</td>
    <td style="white-space: nowrap; text-align: right">±5.55%</td>
    <td style="white-space: nowrap; text-align: right">34.98 μs</td>
    <td style="white-space: nowrap; text-align: right">38.84 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">15.56 K</td>
    <td style="white-space: nowrap; text-align: right">64.28 μs</td>
    <td style="white-space: nowrap; text-align: right">±2.78%</td>
    <td style="white-space: nowrap; text-align: right">63.99 μs</td>
    <td style="white-space: nowrap; text-align: right">70.66 μs</td>
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
    <td style="white-space: nowrap;text-align: right">136.21 K</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">134.70 K</td>
    <td style="white-space: nowrap; text-align: right">1.01x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">125.94 K</td>
    <td style="white-space: nowrap; text-align: right">1.08x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">64.42 K</td>
    <td style="white-space: nowrap; text-align: right">2.11x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">60.17 K</td>
    <td style="white-space: nowrap; text-align: right">2.26x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">55.00 K</td>
    <td style="white-space: nowrap; text-align: right">2.48x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">53.13 K</td>
    <td style="white-space: nowrap; text-align: right">2.56x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">38.75 K</td>
    <td style="white-space: nowrap; text-align: right">3.52x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">36.25 K</td>
    <td style="white-space: nowrap; text-align: right">3.76x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">29.61 K</td>
    <td style="white-space: nowrap; text-align: right">4.6x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">28.19 K</td>
    <td style="white-space: nowrap; text-align: right">4.83x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">15.56 K</td>
    <td style="white-space: nowrap; text-align: right">8.76x</td>
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
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap">9.52 KB</td>
    <td>0.17x</td>
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
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap">24.06 KB</td>
    <td>0.44x</td>
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
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap">47.56 KB</td>
    <td>0.87x</td>
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
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">5.71 M</td>
    <td style="white-space: nowrap; text-align: right">175.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±1267.91%</td>
    <td style="white-space: nowrap; text-align: right">135 ns</td>
    <td style="white-space: nowrap; text-align: right">440 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">5.45 M</td>
    <td style="white-space: nowrap; text-align: right">183.51 ns</td>
    <td style="white-space: nowrap; text-align: right">±1026.85%</td>
    <td style="white-space: nowrap; text-align: right">157 ns</td>
    <td style="white-space: nowrap; text-align: right">325 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">4.57 M</td>
    <td style="white-space: nowrap; text-align: right">219.03 ns</td>
    <td style="white-space: nowrap; text-align: right">±3297.01%</td>
    <td style="white-space: nowrap; text-align: right">174 ns</td>
    <td style="white-space: nowrap; text-align: right">236 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">2.98 M</td>
    <td style="white-space: nowrap; text-align: right">335.89 ns</td>
    <td style="white-space: nowrap; text-align: right">±802.10%</td>
    <td style="white-space: nowrap; text-align: right">304 ns</td>
    <td style="white-space: nowrap; text-align: right">562 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">1.91 M</td>
    <td style="white-space: nowrap; text-align: right">524.04 ns</td>
    <td style="white-space: nowrap; text-align: right">±8.59%</td>
    <td style="white-space: nowrap; text-align: right">514 ns</td>
    <td style="white-space: nowrap; text-align: right">662 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">1.88 M</td>
    <td style="white-space: nowrap; text-align: right">532.90 ns</td>
    <td style="white-space: nowrap; text-align: right">±34.28%</td>
    <td style="white-space: nowrap; text-align: right">511 ns</td>
    <td style="white-space: nowrap; text-align: right">820 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">1.80 M</td>
    <td style="white-space: nowrap; text-align: right">555.13 ns</td>
    <td style="white-space: nowrap; text-align: right">±30.65%</td>
    <td style="white-space: nowrap; text-align: right">523 ns</td>
    <td style="white-space: nowrap; text-align: right">1774.24 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">1.27 M</td>
    <td style="white-space: nowrap; text-align: right">788.33 ns</td>
    <td style="white-space: nowrap; text-align: right">±92.80%</td>
    <td style="white-space: nowrap; text-align: right">736 ns</td>
    <td style="white-space: nowrap; text-align: right">2616 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">1.14 M</td>
    <td style="white-space: nowrap; text-align: right">879.69 ns</td>
    <td style="white-space: nowrap; text-align: right">±20.50%</td>
    <td style="white-space: nowrap; text-align: right">844 ns</td>
    <td style="white-space: nowrap; text-align: right">1886.68 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">0.91 M</td>
    <td style="white-space: nowrap; text-align: right">1093.92 ns</td>
    <td style="white-space: nowrap; text-align: right">±50.69%</td>
    <td style="white-space: nowrap; text-align: right">1027 ns</td>
    <td style="white-space: nowrap; text-align: right">2987.35 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">0.84 M</td>
    <td style="white-space: nowrap; text-align: right">1196.90 ns</td>
    <td style="white-space: nowrap; text-align: right">±131.92%</td>
    <td style="white-space: nowrap; text-align: right">1174 ns</td>
    <td style="white-space: nowrap; text-align: right">1333 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">0.44 M</td>
    <td style="white-space: nowrap; text-align: right">2278.51 ns</td>
    <td style="white-space: nowrap; text-align: right">±34.62%</td>
    <td style="white-space: nowrap; text-align: right">2188 ns</td>
    <td style="white-space: nowrap; text-align: right">3336.39 ns</td>
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
    <td style="white-space: nowrap;text-align: right">5.71 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">5.45 M</td>
    <td style="white-space: nowrap; text-align: right">1.05x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">4.57 M</td>
    <td style="white-space: nowrap; text-align: right">1.25x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">2.98 M</td>
    <td style="white-space: nowrap; text-align: right">1.92x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">1.91 M</td>
    <td style="white-space: nowrap; text-align: right">2.99x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">1.88 M</td>
    <td style="white-space: nowrap; text-align: right">3.04x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">1.80 M</td>
    <td style="white-space: nowrap; text-align: right">3.17x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">1.27 M</td>
    <td style="white-space: nowrap; text-align: right">4.5x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">1.14 M</td>
    <td style="white-space: nowrap; text-align: right">5.02x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">0.91 M</td>
    <td style="white-space: nowrap; text-align: right">6.25x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">0.84 M</td>
    <td style="white-space: nowrap; text-align: right">6.83x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">0.44 M</td>
    <td style="white-space: nowrap; text-align: right">13.01x</td>
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
    <td style="white-space: nowrap">1344 B</td>
      <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap">512 B</td>
    <td>0.38x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap">368 B</td>
    <td>0.27x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap">104 B</td>
    <td>0.08x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap">400 B</td>
    <td>0.3x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap">384 B</td>
    <td>0.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap">248 B</td>
    <td>0.18x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap">1712 B</td>
    <td>1.27x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap">248 B</td>
    <td>0.18x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap">656 B</td>
    <td>0.49x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap">1624 B</td>
    <td>1.21x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
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
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">68.73 M</td>
    <td style="white-space: nowrap; text-align: right">14.55 ns</td>
    <td style="white-space: nowrap; text-align: right">±1199.05%</td>
    <td style="white-space: nowrap; text-align: right">13 ns</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">64.66 M</td>
    <td style="white-space: nowrap; text-align: right">15.46 ns</td>
    <td style="white-space: nowrap; text-align: right">±1090.14%</td>
    <td style="white-space: nowrap; text-align: right">13 ns</td>
    <td style="white-space: nowrap; text-align: right">31 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">42.70 M</td>
    <td style="white-space: nowrap; text-align: right">23.42 ns</td>
    <td style="white-space: nowrap; text-align: right">±2222.66%</td>
    <td style="white-space: nowrap; text-align: right">21 ns</td>
    <td style="white-space: nowrap; text-align: right">50 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">23.38 M</td>
    <td style="white-space: nowrap; text-align: right">42.77 ns</td>
    <td style="white-space: nowrap; text-align: right">±118.73%</td>
    <td style="white-space: nowrap; text-align: right">40 ns</td>
    <td style="white-space: nowrap; text-align: right">61 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">22.29 M</td>
    <td style="white-space: nowrap; text-align: right">44.86 ns</td>
    <td style="white-space: nowrap; text-align: right">±52.18%</td>
    <td style="white-space: nowrap; text-align: right">41 ns</td>
    <td style="white-space: nowrap; text-align: right">103 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">20.74 M</td>
    <td style="white-space: nowrap; text-align: right">48.22 ns</td>
    <td style="white-space: nowrap; text-align: right">±83.34%</td>
    <td style="white-space: nowrap; text-align: right">44 ns</td>
    <td style="white-space: nowrap; text-align: right">84 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">18.39 M</td>
    <td style="white-space: nowrap; text-align: right">54.38 ns</td>
    <td style="white-space: nowrap; text-align: right">±41.60%</td>
    <td style="white-space: nowrap; text-align: right">50 ns</td>
    <td style="white-space: nowrap; text-align: right">95 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">12.66 M</td>
    <td style="white-space: nowrap; text-align: right">78.98 ns</td>
    <td style="white-space: nowrap; text-align: right">±20.39%</td>
    <td style="white-space: nowrap; text-align: right">75 ns</td>
    <td style="white-space: nowrap; text-align: right">126 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">12.02 M</td>
    <td style="white-space: nowrap; text-align: right">83.20 ns</td>
    <td style="white-space: nowrap; text-align: right">±48.78%</td>
    <td style="white-space: nowrap; text-align: right">76 ns</td>
    <td style="white-space: nowrap; text-align: right">141 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">11.27 M</td>
    <td style="white-space: nowrap; text-align: right">88.75 ns</td>
    <td style="white-space: nowrap; text-align: right">±83.70%</td>
    <td style="white-space: nowrap; text-align: right">82 ns</td>
    <td style="white-space: nowrap; text-align: right">183 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.96 M</td>
    <td style="white-space: nowrap; text-align: right">111.56 ns</td>
    <td style="white-space: nowrap; text-align: right">±15.70%</td>
    <td style="white-space: nowrap; text-align: right">109 ns</td>
    <td style="white-space: nowrap; text-align: right">149 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.53 M</td>
    <td style="white-space: nowrap; text-align: right">153.11 ns</td>
    <td style="white-space: nowrap; text-align: right">±24.34%</td>
    <td style="white-space: nowrap; text-align: right">150 ns</td>
    <td style="white-space: nowrap; text-align: right">191 ns</td>
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
    <td style="white-space: nowrap;text-align: right">68.73 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">64.66 M</td>
    <td style="white-space: nowrap; text-align: right">1.06x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">42.70 M</td>
    <td style="white-space: nowrap; text-align: right">1.61x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">23.38 M</td>
    <td style="white-space: nowrap; text-align: right">2.94x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">22.29 M</td>
    <td style="white-space: nowrap; text-align: right">3.08x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">20.74 M</td>
    <td style="white-space: nowrap; text-align: right">3.31x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">18.39 M</td>
    <td style="white-space: nowrap; text-align: right">3.74x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">12.66 M</td>
    <td style="white-space: nowrap; text-align: right">5.43x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">12.02 M</td>
    <td style="white-space: nowrap; text-align: right">5.72x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">11.27 M</td>
    <td style="white-space: nowrap; text-align: right">6.1x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.96 M</td>
    <td style="white-space: nowrap; text-align: right">7.67x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.53 M</td>
    <td style="white-space: nowrap; text-align: right">10.52x</td>
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
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">45.10 M</td>
    <td style="white-space: nowrap; text-align: right">22.17 ns</td>
    <td style="white-space: nowrap; text-align: right">±774.40%</td>
    <td style="white-space: nowrap; text-align: right">20 ns</td>
    <td style="white-space: nowrap; text-align: right">35 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">39.85 M</td>
    <td style="white-space: nowrap; text-align: right">25.09 ns</td>
    <td style="white-space: nowrap; text-align: right">±624.74%</td>
    <td style="white-space: nowrap; text-align: right">22 ns</td>
    <td style="white-space: nowrap; text-align: right">49 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">30.43 M</td>
    <td style="white-space: nowrap; text-align: right">32.87 ns</td>
    <td style="white-space: nowrap; text-align: right">±1087.83%</td>
    <td style="white-space: nowrap; text-align: right">30 ns</td>
    <td style="white-space: nowrap; text-align: right">80 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">19.95 M</td>
    <td style="white-space: nowrap; text-align: right">50.13 ns</td>
    <td style="white-space: nowrap; text-align: right">±1021.41%</td>
    <td style="white-space: nowrap; text-align: right">46 ns</td>
    <td style="white-space: nowrap; text-align: right">68 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">15.58 M</td>
    <td style="white-space: nowrap; text-align: right">64.20 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.46%</td>
    <td style="white-space: nowrap; text-align: right">60 ns</td>
    <td style="white-space: nowrap; text-align: right">105 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">11.49 M</td>
    <td style="white-space: nowrap; text-align: right">87.06 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.69%</td>
    <td style="white-space: nowrap; text-align: right">82 ns</td>
    <td style="white-space: nowrap; text-align: right">137 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.97 M</td>
    <td style="white-space: nowrap; text-align: right">91.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±23.17%</td>
    <td style="white-space: nowrap; text-align: right">85 ns</td>
    <td style="white-space: nowrap; text-align: right">144 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.25 M</td>
    <td style="white-space: nowrap; text-align: right">121.25 ns</td>
    <td style="white-space: nowrap; text-align: right">±18.07%</td>
    <td style="white-space: nowrap; text-align: right">118 ns</td>
    <td style="white-space: nowrap; text-align: right">155.21 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">6.01 M</td>
    <td style="white-space: nowrap; text-align: right">166.44 ns</td>
    <td style="white-space: nowrap; text-align: right">±45.81%</td>
    <td style="white-space: nowrap; text-align: right">159 ns</td>
    <td style="white-space: nowrap; text-align: right">284 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.88 M</td>
    <td style="white-space: nowrap; text-align: right">169.93 ns</td>
    <td style="white-space: nowrap; text-align: right">±19.51%</td>
    <td style="white-space: nowrap; text-align: right">167 ns</td>
    <td style="white-space: nowrap; text-align: right">207 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">4.17 M</td>
    <td style="white-space: nowrap; text-align: right">239.93 ns</td>
    <td style="white-space: nowrap; text-align: right">±10.39%</td>
    <td style="white-space: nowrap; text-align: right">237 ns</td>
    <td style="white-space: nowrap; text-align: right">316 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.44 M</td>
    <td style="white-space: nowrap; text-align: right">409.27 ns</td>
    <td style="white-space: nowrap; text-align: right">±10.53%</td>
    <td style="white-space: nowrap; text-align: right">405 ns</td>
    <td style="white-space: nowrap; text-align: right">644.21 ns</td>
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
    <td style="white-space: nowrap;text-align: right">45.10 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">39.85 M</td>
    <td style="white-space: nowrap; text-align: right">1.13x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">30.43 M</td>
    <td style="white-space: nowrap; text-align: right">1.48x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">19.95 M</td>
    <td style="white-space: nowrap; text-align: right">2.26x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">15.58 M</td>
    <td style="white-space: nowrap; text-align: right">2.9x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">11.49 M</td>
    <td style="white-space: nowrap; text-align: right">3.93x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.97 M</td>
    <td style="white-space: nowrap; text-align: right">4.11x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.25 M</td>
    <td style="white-space: nowrap; text-align: right">5.47x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">6.01 M</td>
    <td style="white-space: nowrap; text-align: right">7.51x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.88 M</td>
    <td style="white-space: nowrap; text-align: right">7.66x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">4.17 M</td>
    <td style="white-space: nowrap; text-align: right">10.82x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.44 M</td>
    <td style="white-space: nowrap; text-align: right">18.46x</td>
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
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">44.65 M</td>
    <td style="white-space: nowrap; text-align: right">22.39 ns</td>
    <td style="white-space: nowrap; text-align: right">±853.18%</td>
    <td style="white-space: nowrap; text-align: right">20 ns</td>
    <td style="white-space: nowrap; text-align: right">34 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">44.31 M</td>
    <td style="white-space: nowrap; text-align: right">22.57 ns</td>
    <td style="white-space: nowrap; text-align: right">±936.09%</td>
    <td style="white-space: nowrap; text-align: right">20 ns</td>
    <td style="white-space: nowrap; text-align: right">46 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">32.61 M</td>
    <td style="white-space: nowrap; text-align: right">30.66 ns</td>
    <td style="white-space: nowrap; text-align: right">±1700.95%</td>
    <td style="white-space: nowrap; text-align: right">28 ns</td>
    <td style="white-space: nowrap; text-align: right">54 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">21.13 M</td>
    <td style="white-space: nowrap; text-align: right">47.33 ns</td>
    <td style="white-space: nowrap; text-align: right">±157.58%</td>
    <td style="white-space: nowrap; text-align: right">45 ns</td>
    <td style="white-space: nowrap; text-align: right">65 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">14.44 M</td>
    <td style="white-space: nowrap; text-align: right">69.27 ns</td>
    <td style="white-space: nowrap; text-align: right">±36.36%</td>
    <td style="white-space: nowrap; text-align: right">67 ns</td>
    <td style="white-space: nowrap; text-align: right">110 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">13.40 M</td>
    <td style="white-space: nowrap; text-align: right">74.60 ns</td>
    <td style="white-space: nowrap; text-align: right">±26.36%</td>
    <td style="white-space: nowrap; text-align: right">72 ns</td>
    <td style="white-space: nowrap; text-align: right">118 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.86 M</td>
    <td style="white-space: nowrap; text-align: right">92.12 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.67%</td>
    <td style="white-space: nowrap; text-align: right">86 ns</td>
    <td style="white-space: nowrap; text-align: right">146 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.45 M</td>
    <td style="white-space: nowrap; text-align: right">118.28 ns</td>
    <td style="white-space: nowrap; text-align: right">±14.35%</td>
    <td style="white-space: nowrap; text-align: right">116 ns</td>
    <td style="white-space: nowrap; text-align: right">152 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.90 M</td>
    <td style="white-space: nowrap; text-align: right">169.59 ns</td>
    <td style="white-space: nowrap; text-align: right">±40.25%</td>
    <td style="white-space: nowrap; text-align: right">165 ns</td>
    <td style="white-space: nowrap; text-align: right">214 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">4.23 M</td>
    <td style="white-space: nowrap; text-align: right">236.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±10.75%</td>
    <td style="white-space: nowrap; text-align: right">233 ns</td>
    <td style="white-space: nowrap; text-align: right">312 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">3.85 M</td>
    <td style="white-space: nowrap; text-align: right">259.59 ns</td>
    <td style="white-space: nowrap; text-align: right">±33.84%</td>
    <td style="white-space: nowrap; text-align: right">254 ns</td>
    <td style="white-space: nowrap; text-align: right">504 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.33 M</td>
    <td style="white-space: nowrap; text-align: right">753.42 ns</td>
    <td style="white-space: nowrap; text-align: right">±12.49%</td>
    <td style="white-space: nowrap; text-align: right">732 ns</td>
    <td style="white-space: nowrap; text-align: right">1122 ns</td>
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
    <td style="white-space: nowrap;text-align: right">44.65 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">44.31 M</td>
    <td style="white-space: nowrap; text-align: right">1.01x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">32.61 M</td>
    <td style="white-space: nowrap; text-align: right">1.37x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">21.13 M</td>
    <td style="white-space: nowrap; text-align: right">2.11x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">14.44 M</td>
    <td style="white-space: nowrap; text-align: right">3.09x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">13.40 M</td>
    <td style="white-space: nowrap; text-align: right">3.33x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.86 M</td>
    <td style="white-space: nowrap; text-align: right">4.11x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.45 M</td>
    <td style="white-space: nowrap; text-align: right">5.28x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.90 M</td>
    <td style="white-space: nowrap; text-align: right">7.57x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">4.23 M</td>
    <td style="white-space: nowrap; text-align: right">10.55x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">3.85 M</td>
    <td style="white-space: nowrap; text-align: right">11.59x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.33 M</td>
    <td style="white-space: nowrap; text-align: right">33.64x</td>
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
    <td style="white-space: nowrap; text-align: right">27.27 M</td>
    <td style="white-space: nowrap; text-align: right">36.68 ns</td>
    <td style="white-space: nowrap; text-align: right">±58.82%</td>
    <td style="white-space: nowrap; text-align: right">32 ns</td>
    <td style="white-space: nowrap; text-align: right">80 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">23.96 M</td>
    <td style="white-space: nowrap; text-align: right">41.73 ns</td>
    <td style="white-space: nowrap; text-align: right">±5207.19%</td>
    <td style="white-space: nowrap; text-align: right">33 ns</td>
    <td style="white-space: nowrap; text-align: right">53 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.63 M</td>
    <td style="white-space: nowrap; text-align: right">60.15 ns</td>
    <td style="white-space: nowrap; text-align: right">±3381.98%</td>
    <td style="white-space: nowrap; text-align: right">49 ns</td>
    <td style="white-space: nowrap; text-align: right">67 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">14.27 M</td>
    <td style="white-space: nowrap; text-align: right">70.06 ns</td>
    <td style="white-space: nowrap; text-align: right">±1541.08%</td>
    <td style="white-space: nowrap; text-align: right">57 ns</td>
    <td style="white-space: nowrap; text-align: right">70 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">11.64 M</td>
    <td style="white-space: nowrap; text-align: right">85.92 ns</td>
    <td style="white-space: nowrap; text-align: right">±5760.34%</td>
    <td style="white-space: nowrap; text-align: right">44 ns</td>
    <td style="white-space: nowrap; text-align: right">122 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">10.39 M</td>
    <td style="white-space: nowrap; text-align: right">96.28 ns</td>
    <td style="white-space: nowrap; text-align: right">±475.20%</td>
    <td style="white-space: nowrap; text-align: right">81 ns</td>
    <td style="white-space: nowrap; text-align: right">188 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">8.89 M</td>
    <td style="white-space: nowrap; text-align: right">112.45 ns</td>
    <td style="white-space: nowrap; text-align: right">±248.53%</td>
    <td style="white-space: nowrap; text-align: right">81 ns</td>
    <td style="white-space: nowrap; text-align: right">1380 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.76 M</td>
    <td style="white-space: nowrap; text-align: right">114.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±51.01%</td>
    <td style="white-space: nowrap; text-align: right">108 ns</td>
    <td style="white-space: nowrap; text-align: right">168 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">7.38 M</td>
    <td style="white-space: nowrap; text-align: right">135.45 ns</td>
    <td style="white-space: nowrap; text-align: right">±14.90%</td>
    <td style="white-space: nowrap; text-align: right">131 ns</td>
    <td style="white-space: nowrap; text-align: right">186 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">6.92 M</td>
    <td style="white-space: nowrap; text-align: right">144.56 ns</td>
    <td style="white-space: nowrap; text-align: right">±197.80%</td>
    <td style="white-space: nowrap; text-align: right">119 ns</td>
    <td style="white-space: nowrap; text-align: right">191.34 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.78 M</td>
    <td style="white-space: nowrap; text-align: right">172.98 ns</td>
    <td style="white-space: nowrap; text-align: right">±18.07%</td>
    <td style="white-space: nowrap; text-align: right">169 ns</td>
    <td style="white-space: nowrap; text-align: right">251 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.20 M</td>
    <td style="white-space: nowrap; text-align: right">238.03 ns</td>
    <td style="white-space: nowrap; text-align: right">±120.54%</td>
    <td style="white-space: nowrap; text-align: right">209 ns</td>
    <td style="white-space: nowrap; text-align: right">537 ns</td>
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
    <td style="white-space: nowrap;text-align: right">27.27 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">23.96 M</td>
    <td style="white-space: nowrap; text-align: right">1.14x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.63 M</td>
    <td style="white-space: nowrap; text-align: right">1.64x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">14.27 M</td>
    <td style="white-space: nowrap; text-align: right">1.91x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">11.64 M</td>
    <td style="white-space: nowrap; text-align: right">2.34x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">10.39 M</td>
    <td style="white-space: nowrap; text-align: right">2.63x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">8.89 M</td>
    <td style="white-space: nowrap; text-align: right">3.07x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.76 M</td>
    <td style="white-space: nowrap; text-align: right">3.11x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">7.38 M</td>
    <td style="white-space: nowrap; text-align: right">3.69x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">6.92 M</td>
    <td style="white-space: nowrap; text-align: right">3.94x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.78 M</td>
    <td style="white-space: nowrap; text-align: right">4.72x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.20 M</td>
    <td style="white-space: nowrap; text-align: right">6.49x</td>
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
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">15.27 M</td>
    <td style="white-space: nowrap; text-align: right">65.47 ns</td>
    <td style="white-space: nowrap; text-align: right">±3120.86%</td>
    <td style="white-space: nowrap; text-align: right">54 ns</td>
    <td style="white-space: nowrap; text-align: right">72 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">15.10 M</td>
    <td style="white-space: nowrap; text-align: right">66.21 ns</td>
    <td style="white-space: nowrap; text-align: right">±18671.77%</td>
    <td style="white-space: nowrap; text-align: right">36 ns</td>
    <td style="white-space: nowrap; text-align: right">77 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">13.68 M</td>
    <td style="white-space: nowrap; text-align: right">73.11 ns</td>
    <td style="white-space: nowrap; text-align: right">±1299.96%</td>
    <td style="white-space: nowrap; text-align: right">61 ns</td>
    <td style="white-space: nowrap; text-align: right">73 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">10.92 M</td>
    <td style="white-space: nowrap; text-align: right">91.58 ns</td>
    <td style="white-space: nowrap; text-align: right">±7470.26%</td>
    <td style="white-space: nowrap; text-align: right">47 ns</td>
    <td style="white-space: nowrap; text-align: right">123 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.78 M</td>
    <td style="white-space: nowrap; text-align: right">113.86 ns</td>
    <td style="white-space: nowrap; text-align: right">±23.14%</td>
    <td style="white-space: nowrap; text-align: right">107 ns</td>
    <td style="white-space: nowrap; text-align: right">257 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">8.12 M</td>
    <td style="white-space: nowrap; text-align: right">123.21 ns</td>
    <td style="white-space: nowrap; text-align: right">±14.70%</td>
    <td style="white-space: nowrap; text-align: right">119 ns</td>
    <td style="white-space: nowrap; text-align: right">183 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">7.37 M</td>
    <td style="white-space: nowrap; text-align: right">135.71 ns</td>
    <td style="white-space: nowrap; text-align: right">±14.09%</td>
    <td style="white-space: nowrap; text-align: right">130 ns</td>
    <td style="white-space: nowrap; text-align: right">184 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.11 M</td>
    <td style="white-space: nowrap; text-align: right">195.53 ns</td>
    <td style="white-space: nowrap; text-align: right">±19.74%</td>
    <td style="white-space: nowrap; text-align: right">193 ns</td>
    <td style="white-space: nowrap; text-align: right">236.16 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">4.88 M</td>
    <td style="white-space: nowrap; text-align: right">204.95 ns</td>
    <td style="white-space: nowrap; text-align: right">±112.99%</td>
    <td style="white-space: nowrap; text-align: right">195 ns</td>
    <td style="white-space: nowrap; text-align: right">424 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.82 M</td>
    <td style="white-space: nowrap; text-align: right">261.53 ns</td>
    <td style="white-space: nowrap; text-align: right">±102.32%</td>
    <td style="white-space: nowrap; text-align: right">235 ns</td>
    <td style="white-space: nowrap; text-align: right">527.42 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">3.78 M</td>
    <td style="white-space: nowrap; text-align: right">264.37 ns</td>
    <td style="white-space: nowrap; text-align: right">±13.83%</td>
    <td style="white-space: nowrap; text-align: right">260 ns</td>
    <td style="white-space: nowrap; text-align: right">316 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.68 M</td>
    <td style="white-space: nowrap; text-align: right">373.65 ns</td>
    <td style="white-space: nowrap; text-align: right">±412.53%</td>
    <td style="white-space: nowrap; text-align: right">355 ns</td>
    <td style="white-space: nowrap; text-align: right">608 ns</td>
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
    <td style="white-space: nowrap;text-align: right">15.27 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">15.10 M</td>
    <td style="white-space: nowrap; text-align: right">1.01x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">13.68 M</td>
    <td style="white-space: nowrap; text-align: right">1.12x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">10.92 M</td>
    <td style="white-space: nowrap; text-align: right">1.4x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.78 M</td>
    <td style="white-space: nowrap; text-align: right">1.74x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">8.12 M</td>
    <td style="white-space: nowrap; text-align: right">1.88x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">7.37 M</td>
    <td style="white-space: nowrap; text-align: right">2.07x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.11 M</td>
    <td style="white-space: nowrap; text-align: right">2.99x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">4.88 M</td>
    <td style="white-space: nowrap; text-align: right">3.13x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.82 M</td>
    <td style="white-space: nowrap; text-align: right">3.99x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">3.78 M</td>
    <td style="white-space: nowrap; text-align: right">4.04x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.68 M</td>
    <td style="white-space: nowrap; text-align: right">5.71x</td>
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
    <td style="white-space: nowrap; text-align: right">40.48 M</td>
    <td style="white-space: nowrap; text-align: right">24.70 ns</td>
    <td style="white-space: nowrap; text-align: right">±7388.70%</td>
    <td style="white-space: nowrap; text-align: right">16 ns</td>
    <td style="white-space: nowrap; text-align: right">41 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">23.82 M</td>
    <td style="white-space: nowrap; text-align: right">41.98 ns</td>
    <td style="white-space: nowrap; text-align: right">±2819.22%</td>
    <td style="white-space: nowrap; text-align: right">33 ns</td>
    <td style="white-space: nowrap; text-align: right">51 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">19.93 M</td>
    <td style="white-space: nowrap; text-align: right">50.19 ns</td>
    <td style="white-space: nowrap; text-align: right">±1703.77%</td>
    <td style="white-space: nowrap; text-align: right">40 ns</td>
    <td style="white-space: nowrap; text-align: right">56 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">14.79 M</td>
    <td style="white-space: nowrap; text-align: right">67.62 ns</td>
    <td style="white-space: nowrap; text-align: right">±7105.44%</td>
    <td style="white-space: nowrap; text-align: right">27 ns</td>
    <td style="white-space: nowrap; text-align: right">100 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">11.11 M</td>
    <td style="white-space: nowrap; text-align: right">90.00 ns</td>
    <td style="white-space: nowrap; text-align: right">±21.33%</td>
    <td style="white-space: nowrap; text-align: right">87 ns</td>
    <td style="white-space: nowrap; text-align: right">133 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.90 M</td>
    <td style="white-space: nowrap; text-align: right">100.97 ns</td>
    <td style="white-space: nowrap; text-align: right">±22.17%</td>
    <td style="white-space: nowrap; text-align: right">95 ns</td>
    <td style="white-space: nowrap; text-align: right">150 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">7.13 M</td>
    <td style="white-space: nowrap; text-align: right">140.17 ns</td>
    <td style="white-space: nowrap; text-align: right">±20.40%</td>
    <td style="white-space: nowrap; text-align: right">136 ns</td>
    <td style="white-space: nowrap; text-align: right">189 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.01 M</td>
    <td style="white-space: nowrap; text-align: right">166.49 ns</td>
    <td style="white-space: nowrap; text-align: right">±29.36%</td>
    <td style="white-space: nowrap; text-align: right">163 ns</td>
    <td style="white-space: nowrap; text-align: right">203 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.04 M</td>
    <td style="white-space: nowrap; text-align: right">247.29 ns</td>
    <td style="white-space: nowrap; text-align: right">±121.04%</td>
    <td style="white-space: nowrap; text-align: right">219 ns</td>
    <td style="white-space: nowrap; text-align: right">623 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">3.36 M</td>
    <td style="white-space: nowrap; text-align: right">297.34 ns</td>
    <td style="white-space: nowrap; text-align: right">±72.69%</td>
    <td style="white-space: nowrap; text-align: right">284 ns</td>
    <td style="white-space: nowrap; text-align: right">535 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">2.72 M</td>
    <td style="white-space: nowrap; text-align: right">367.10 ns</td>
    <td style="white-space: nowrap; text-align: right">±12.40%</td>
    <td style="white-space: nowrap; text-align: right">362 ns</td>
    <td style="white-space: nowrap; text-align: right">418 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.46 M</td>
    <td style="white-space: nowrap; text-align: right">686.91 ns</td>
    <td style="white-space: nowrap; text-align: right">±164.82%</td>
    <td style="white-space: nowrap; text-align: right">645 ns</td>
    <td style="white-space: nowrap; text-align: right">1303 ns</td>
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
    <td style="white-space: nowrap;text-align: right">40.48 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">23.82 M</td>
    <td style="white-space: nowrap; text-align: right">1.7x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">19.93 M</td>
    <td style="white-space: nowrap; text-align: right">2.03x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">14.79 M</td>
    <td style="white-space: nowrap; text-align: right">2.74x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">11.11 M</td>
    <td style="white-space: nowrap; text-align: right">3.64x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.90 M</td>
    <td style="white-space: nowrap; text-align: right">4.09x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">7.13 M</td>
    <td style="white-space: nowrap; text-align: right">5.67x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.01 M</td>
    <td style="white-space: nowrap; text-align: right">6.74x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.04 M</td>
    <td style="white-space: nowrap; text-align: right">10.01x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">3.36 M</td>
    <td style="white-space: nowrap; text-align: right">12.04x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">2.72 M</td>
    <td style="white-space: nowrap; text-align: right">14.86x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.46 M</td>
    <td style="white-space: nowrap; text-align: right">27.81x</td>
  </tr>
</table>


<hr/>