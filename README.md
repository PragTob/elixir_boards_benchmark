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
    <td style="white-space: nowrap; text-align: right">133.95 K</td>
    <td style="white-space: nowrap; text-align: right">7.47 μs</td>
    <td style="white-space: nowrap; text-align: right">±23.29%</td>
    <td style="white-space: nowrap; text-align: right">6.93 μs</td>
    <td style="white-space: nowrap; text-align: right">10.80 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">132.16 K</td>
    <td style="white-space: nowrap; text-align: right">7.57 μs</td>
    <td style="white-space: nowrap; text-align: right">±29.17%</td>
    <td style="white-space: nowrap; text-align: right">7.21 μs</td>
    <td style="white-space: nowrap; text-align: right">14.02 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">126.54 K</td>
    <td style="white-space: nowrap; text-align: right">7.90 μs</td>
    <td style="white-space: nowrap; text-align: right">±25.69%</td>
    <td style="white-space: nowrap; text-align: right">7.59 μs</td>
    <td style="white-space: nowrap; text-align: right">16.30 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">64.68 K</td>
    <td style="white-space: nowrap; text-align: right">15.46 μs</td>
    <td style="white-space: nowrap; text-align: right">±14.61%</td>
    <td style="white-space: nowrap; text-align: right">15.12 μs</td>
    <td style="white-space: nowrap; text-align: right">21.71 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">60.35 K</td>
    <td style="white-space: nowrap; text-align: right">16.57 μs</td>
    <td style="white-space: nowrap; text-align: right">±9.17%</td>
    <td style="white-space: nowrap; text-align: right">16.04 μs</td>
    <td style="white-space: nowrap; text-align: right">21.09 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">56.76 K</td>
    <td style="white-space: nowrap; text-align: right">17.62 μs</td>
    <td style="white-space: nowrap; text-align: right">±17.45%</td>
    <td style="white-space: nowrap; text-align: right">17.15 μs</td>
    <td style="white-space: nowrap; text-align: right">21.45 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">55.44 K</td>
    <td style="white-space: nowrap; text-align: right">18.04 μs</td>
    <td style="white-space: nowrap; text-align: right">±11.00%</td>
    <td style="white-space: nowrap; text-align: right">16.92 μs</td>
    <td style="white-space: nowrap; text-align: right">22.01 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">53.70 K</td>
    <td style="white-space: nowrap; text-align: right">18.62 μs</td>
    <td style="white-space: nowrap; text-align: right">±8.36%</td>
    <td style="white-space: nowrap; text-align: right">17.96 μs</td>
    <td style="white-space: nowrap; text-align: right">22.32 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">50.74 K</td>
    <td style="white-space: nowrap; text-align: right">19.71 μs</td>
    <td style="white-space: nowrap; text-align: right">±10.60%</td>
    <td style="white-space: nowrap; text-align: right">19.29 μs</td>
    <td style="white-space: nowrap; text-align: right">22.71 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">39.53 K</td>
    <td style="white-space: nowrap; text-align: right">25.30 μs</td>
    <td style="white-space: nowrap; text-align: right">±10.51%</td>
    <td style="white-space: nowrap; text-align: right">24.82 μs</td>
    <td style="white-space: nowrap; text-align: right">28.42 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">36.24 K</td>
    <td style="white-space: nowrap; text-align: right">27.59 μs</td>
    <td style="white-space: nowrap; text-align: right">±8.32%</td>
    <td style="white-space: nowrap; text-align: right">27.71 μs</td>
    <td style="white-space: nowrap; text-align: right">32.27 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">29.65 K</td>
    <td style="white-space: nowrap; text-align: right">33.73 μs</td>
    <td style="white-space: nowrap; text-align: right">±4.12%</td>
    <td style="white-space: nowrap; text-align: right">33.31 μs</td>
    <td style="white-space: nowrap; text-align: right">36.99 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">28.23 K</td>
    <td style="white-space: nowrap; text-align: right">35.42 μs</td>
    <td style="white-space: nowrap; text-align: right">±3.86%</td>
    <td style="white-space: nowrap; text-align: right">34.96 μs</td>
    <td style="white-space: nowrap; text-align: right">38.34 μs</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">15.41 K</td>
    <td style="white-space: nowrap; text-align: right">64.90 μs</td>
    <td style="white-space: nowrap; text-align: right">±2.84%</td>
    <td style="white-space: nowrap; text-align: right">64.91 μs</td>
    <td style="white-space: nowrap; text-align: right">70.59 μs</td>
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
    <td style="white-space: nowrap;text-align: right">133.95 K</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">132.16 K</td>
    <td style="white-space: nowrap; text-align: right">1.01x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">126.54 K</td>
    <td style="white-space: nowrap; text-align: right">1.06x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">64.68 K</td>
    <td style="white-space: nowrap; text-align: right">2.07x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">60.35 K</td>
    <td style="white-space: nowrap; text-align: right">2.22x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">56.76 K</td>
    <td style="white-space: nowrap; text-align: right">2.36x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">55.44 K</td>
    <td style="white-space: nowrap; text-align: right">2.42x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">53.70 K</td>
    <td style="white-space: nowrap; text-align: right">2.49x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">50.74 K</td>
    <td style="white-space: nowrap; text-align: right">2.64x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">39.53 K</td>
    <td style="white-space: nowrap; text-align: right">3.39x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">36.24 K</td>
    <td style="white-space: nowrap; text-align: right">3.7x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">29.65 K</td>
    <td style="white-space: nowrap; text-align: right">4.52x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">28.23 K</td>
    <td style="white-space: nowrap; text-align: right">4.75x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">15.41 K</td>
    <td style="white-space: nowrap; text-align: right">8.69x</td>
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
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap">34.33 KB</td>
    <td>0.63x</td>
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
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap">38.10 KB</td>
    <td>0.69x</td>
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
    <td style="white-space: nowrap; text-align: right">6.02 M</td>
    <td style="white-space: nowrap; text-align: right">166.04 ns</td>
    <td style="white-space: nowrap; text-align: right">±721.06%</td>
    <td style="white-space: nowrap; text-align: right">127 ns</td>
    <td style="white-space: nowrap; text-align: right">424 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">5.89 M</td>
    <td style="white-space: nowrap; text-align: right">169.76 ns</td>
    <td style="white-space: nowrap; text-align: right">±1323.53%</td>
    <td style="white-space: nowrap; text-align: right">153 ns</td>
    <td style="white-space: nowrap; text-align: right">350 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">5.01 M</td>
    <td style="white-space: nowrap; text-align: right">199.45 ns</td>
    <td style="white-space: nowrap; text-align: right">±907.01%</td>
    <td style="white-space: nowrap; text-align: right">178 ns</td>
    <td style="white-space: nowrap; text-align: right">296 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">3.09 M</td>
    <td style="white-space: nowrap; text-align: right">323.35 ns</td>
    <td style="white-space: nowrap; text-align: right">±379.04%</td>
    <td style="white-space: nowrap; text-align: right">307 ns</td>
    <td style="white-space: nowrap; text-align: right">547 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">2.16 M</td>
    <td style="white-space: nowrap; text-align: right">462.20 ns</td>
    <td style="white-space: nowrap; text-align: right">±835.43%</td>
    <td style="white-space: nowrap; text-align: right">421 ns</td>
    <td style="white-space: nowrap; text-align: right">698 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">1.84 M</td>
    <td style="white-space: nowrap; text-align: right">542.80 ns</td>
    <td style="white-space: nowrap; text-align: right">±29.17%</td>
    <td style="white-space: nowrap; text-align: right">506 ns</td>
    <td style="white-space: nowrap; text-align: right">730 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">1.83 M</td>
    <td style="white-space: nowrap; text-align: right">547.30 ns</td>
    <td style="white-space: nowrap; text-align: right">±32.92%</td>
    <td style="white-space: nowrap; text-align: right">515 ns</td>
    <td style="white-space: nowrap; text-align: right">1474.88 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">1.79 M</td>
    <td style="white-space: nowrap; text-align: right">560.05 ns</td>
    <td style="white-space: nowrap; text-align: right">±41.55%</td>
    <td style="white-space: nowrap; text-align: right">528 ns</td>
    <td style="white-space: nowrap; text-align: right">953.76 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">1.76 M</td>
    <td style="white-space: nowrap; text-align: right">569.76 ns</td>
    <td style="white-space: nowrap; text-align: right">±405.50%</td>
    <td style="white-space: nowrap; text-align: right">528 ns</td>
    <td style="white-space: nowrap; text-align: right">873 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">1.29 M</td>
    <td style="white-space: nowrap; text-align: right">777.13 ns</td>
    <td style="white-space: nowrap; text-align: right">±19.67%</td>
    <td style="white-space: nowrap; text-align: right">754 ns</td>
    <td style="white-space: nowrap; text-align: right">2011.91 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">1.10 M</td>
    <td style="white-space: nowrap; text-align: right">907.35 ns</td>
    <td style="white-space: nowrap; text-align: right">±39.78%</td>
    <td style="white-space: nowrap; text-align: right">853 ns</td>
    <td style="white-space: nowrap; text-align: right">1961.88 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">0.91 M</td>
    <td style="white-space: nowrap; text-align: right">1093.69 ns</td>
    <td style="white-space: nowrap; text-align: right">±30.31%</td>
    <td style="white-space: nowrap; text-align: right">1068 ns</td>
    <td style="white-space: nowrap; text-align: right">1514.97 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">0.82 M</td>
    <td style="white-space: nowrap; text-align: right">1215.76 ns</td>
    <td style="white-space: nowrap; text-align: right">±36.83%</td>
    <td style="white-space: nowrap; text-align: right">1183 ns</td>
    <td style="white-space: nowrap; text-align: right">2882 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">0.44 M</td>
    <td style="white-space: nowrap; text-align: right">2277.54 ns</td>
    <td style="white-space: nowrap; text-align: right">±171.70%</td>
    <td style="white-space: nowrap; text-align: right">2160 ns</td>
    <td style="white-space: nowrap; text-align: right">3321.13 ns</td>
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
    <td style="white-space: nowrap;text-align: right">6.02 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">5.89 M</td>
    <td style="white-space: nowrap; text-align: right">1.02x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">5.01 M</td>
    <td style="white-space: nowrap; text-align: right">1.2x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">3.09 M</td>
    <td style="white-space: nowrap; text-align: right">1.95x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">2.16 M</td>
    <td style="white-space: nowrap; text-align: right">2.78x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">1.84 M</td>
    <td style="white-space: nowrap; text-align: right">3.27x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">1.83 M</td>
    <td style="white-space: nowrap; text-align: right">3.3x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">1.79 M</td>
    <td style="white-space: nowrap; text-align: right">3.37x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">1.76 M</td>
    <td style="white-space: nowrap; text-align: right">3.43x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">1.29 M</td>
    <td style="white-space: nowrap; text-align: right">4.68x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">1.10 M</td>
    <td style="white-space: nowrap; text-align: right">5.46x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">0.91 M</td>
    <td style="white-space: nowrap; text-align: right">6.59x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">0.82 M</td>
    <td style="white-space: nowrap; text-align: right">7.32x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">0.44 M</td>
    <td style="white-space: nowrap; text-align: right">13.72x</td>
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
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap">1088 B</td>
    <td>0.81x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap">400 B</td>
    <td>0.3x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap">248 B</td>
    <td>0.18x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap">384 B</td>
    <td>0.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap">1112 B</td>
    <td>0.83x</td>
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
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">44.12 M</td>
    <td style="white-space: nowrap; text-align: right">22.66 ns</td>
    <td style="white-space: nowrap; text-align: right">±842.77%</td>
    <td style="white-space: nowrap; text-align: right">20 ns</td>
    <td style="white-space: nowrap; text-align: right">33 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">42.46 M</td>
    <td style="white-space: nowrap; text-align: right">23.55 ns</td>
    <td style="white-space: nowrap; text-align: right">±846.67%</td>
    <td style="white-space: nowrap; text-align: right">20 ns</td>
    <td style="white-space: nowrap; text-align: right">64 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">30.38 M</td>
    <td style="white-space: nowrap; text-align: right">32.92 ns</td>
    <td style="white-space: nowrap; text-align: right">±84.61%</td>
    <td style="white-space: nowrap; text-align: right">32 ns</td>
    <td style="white-space: nowrap; text-align: right">49 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">29.09 M</td>
    <td style="white-space: nowrap; text-align: right">34.38 ns</td>
    <td style="white-space: nowrap; text-align: right">±111.15%</td>
    <td style="white-space: nowrap; text-align: right">32 ns</td>
    <td style="white-space: nowrap; text-align: right">61 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">18.86 M</td>
    <td style="white-space: nowrap; text-align: right">53.03 ns</td>
    <td style="white-space: nowrap; text-align: right">±37.27%</td>
    <td style="white-space: nowrap; text-align: right">50 ns</td>
    <td style="white-space: nowrap; text-align: right">95 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">18.62 M</td>
    <td style="white-space: nowrap; text-align: right">53.70 ns</td>
    <td style="white-space: nowrap; text-align: right">±67.02%</td>
    <td style="white-space: nowrap; text-align: right">50 ns</td>
    <td style="white-space: nowrap; text-align: right">80 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">18.26 M</td>
    <td style="white-space: nowrap; text-align: right">54.75 ns</td>
    <td style="white-space: nowrap; text-align: right">±56.06%</td>
    <td style="white-space: nowrap; text-align: right">53 ns</td>
    <td style="white-space: nowrap; text-align: right">117 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">17.19 M</td>
    <td style="white-space: nowrap; text-align: right">58.18 ns</td>
    <td style="white-space: nowrap; text-align: right">±1393.09%</td>
    <td style="white-space: nowrap; text-align: right">52 ns</td>
    <td style="white-space: nowrap; text-align: right">71 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">15.79 M</td>
    <td style="white-space: nowrap; text-align: right">63.34 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.86%</td>
    <td style="white-space: nowrap; text-align: right">60 ns</td>
    <td style="white-space: nowrap; text-align: right">108 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">10.54 M</td>
    <td style="white-space: nowrap; text-align: right">94.87 ns</td>
    <td style="white-space: nowrap; text-align: right">±27.72%</td>
    <td style="white-space: nowrap; text-align: right">91 ns</td>
    <td style="white-space: nowrap; text-align: right">142 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.29 M</td>
    <td style="white-space: nowrap; text-align: right">97.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±18.01%</td>
    <td style="white-space: nowrap; text-align: right">93 ns</td>
    <td style="white-space: nowrap; text-align: right">132 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.74 M</td>
    <td style="white-space: nowrap; text-align: right">102.63 ns</td>
    <td style="white-space: nowrap; text-align: right">±26.57%</td>
    <td style="white-space: nowrap; text-align: right">100 ns</td>
    <td style="white-space: nowrap; text-align: right">144 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">9.04 M</td>
    <td style="white-space: nowrap; text-align: right">110.57 ns</td>
    <td style="white-space: nowrap; text-align: right">±69.64%</td>
    <td style="white-space: nowrap; text-align: right">105 ns</td>
    <td style="white-space: nowrap; text-align: right">200 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.47 M</td>
    <td style="white-space: nowrap; text-align: right">154.65 ns</td>
    <td style="white-space: nowrap; text-align: right">±19.27%</td>
    <td style="white-space: nowrap; text-align: right">152 ns</td>
    <td style="white-space: nowrap; text-align: right">190 ns</td>
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
    <td style="white-space: nowrap;text-align: right">44.12 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">42.46 M</td>
    <td style="white-space: nowrap; text-align: right">1.04x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">30.38 M</td>
    <td style="white-space: nowrap; text-align: right">1.45x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">29.09 M</td>
    <td style="white-space: nowrap; text-align: right">1.52x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">18.86 M</td>
    <td style="white-space: nowrap; text-align: right">2.34x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">18.62 M</td>
    <td style="white-space: nowrap; text-align: right">2.37x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">18.26 M</td>
    <td style="white-space: nowrap; text-align: right">2.42x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">17.19 M</td>
    <td style="white-space: nowrap; text-align: right">2.57x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">15.79 M</td>
    <td style="white-space: nowrap; text-align: right">2.79x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">10.54 M</td>
    <td style="white-space: nowrap; text-align: right">4.19x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">10.29 M</td>
    <td style="white-space: nowrap; text-align: right">4.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.74 M</td>
    <td style="white-space: nowrap; text-align: right">4.53x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">9.04 M</td>
    <td style="white-space: nowrap; text-align: right">4.88x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">6.47 M</td>
    <td style="white-space: nowrap; text-align: right">6.82x</td>
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
    <td style="white-space: nowrap; text-align: right">37.76 M</td>
    <td style="white-space: nowrap; text-align: right">26.48 ns</td>
    <td style="white-space: nowrap; text-align: right">±722.24%</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
    <td style="white-space: nowrap; text-align: right">40 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">36.87 M</td>
    <td style="white-space: nowrap; text-align: right">27.12 ns</td>
    <td style="white-space: nowrap; text-align: right">±618.93%</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
    <td style="white-space: nowrap; text-align: right">57 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">28.57 M</td>
    <td style="white-space: nowrap; text-align: right">35.00 ns</td>
    <td style="white-space: nowrap; text-align: right">±78.21%</td>
    <td style="white-space: nowrap; text-align: right">34 ns</td>
    <td style="white-space: nowrap; text-align: right">45 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">27.00 M</td>
    <td style="white-space: nowrap; text-align: right">37.04 ns</td>
    <td style="white-space: nowrap; text-align: right">±131.99%</td>
    <td style="white-space: nowrap; text-align: right">34 ns</td>
    <td style="white-space: nowrap; text-align: right">73 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">18.89 M</td>
    <td style="white-space: nowrap; text-align: right">52.94 ns</td>
    <td style="white-space: nowrap; text-align: right">±843.86%</td>
    <td style="white-space: nowrap; text-align: right">49 ns</td>
    <td style="white-space: nowrap; text-align: right">67 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">16.70 M</td>
    <td style="white-space: nowrap; text-align: right">59.88 ns</td>
    <td style="white-space: nowrap; text-align: right">±34.66%</td>
    <td style="white-space: nowrap; text-align: right">56 ns</td>
    <td style="white-space: nowrap; text-align: right">85 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">14.28 M</td>
    <td style="white-space: nowrap; text-align: right">70.03 ns</td>
    <td style="white-space: nowrap; text-align: right">±49.51%</td>
    <td style="white-space: nowrap; text-align: right">64 ns</td>
    <td style="white-space: nowrap; text-align: right">115 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">10.38 M</td>
    <td style="white-space: nowrap; text-align: right">96.36 ns</td>
    <td style="white-space: nowrap; text-align: right">±30.87%</td>
    <td style="white-space: nowrap; text-align: right">93 ns</td>
    <td style="white-space: nowrap; text-align: right">146 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.97 M</td>
    <td style="white-space: nowrap; text-align: right">100.30 ns</td>
    <td style="white-space: nowrap; text-align: right">±20.77%</td>
    <td style="white-space: nowrap; text-align: right">97 ns</td>
    <td style="white-space: nowrap; text-align: right">136 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.17 M</td>
    <td style="white-space: nowrap; text-align: right">109.02 ns</td>
    <td style="white-space: nowrap; text-align: right">±14.73%</td>
    <td style="white-space: nowrap; text-align: right">107 ns</td>
    <td style="white-space: nowrap; text-align: right">145 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">5.77 M</td>
    <td style="white-space: nowrap; text-align: right">173.18 ns</td>
    <td style="white-space: nowrap; text-align: right">±47.97%</td>
    <td style="white-space: nowrap; text-align: right">164 ns</td>
    <td style="white-space: nowrap; text-align: right">293 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.64 M</td>
    <td style="white-space: nowrap; text-align: right">177.34 ns</td>
    <td style="white-space: nowrap; text-align: right">±34.69%</td>
    <td style="white-space: nowrap; text-align: right">173 ns</td>
    <td style="white-space: nowrap; text-align: right">211 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">3.99 M</td>
    <td style="white-space: nowrap; text-align: right">250.61 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.89%</td>
    <td style="white-space: nowrap; text-align: right">247 ns</td>
    <td style="white-space: nowrap; text-align: right">308 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.46 M</td>
    <td style="white-space: nowrap; text-align: right">407.10 ns</td>
    <td style="white-space: nowrap; text-align: right">±14.32%</td>
    <td style="white-space: nowrap; text-align: right">400 ns</td>
    <td style="white-space: nowrap; text-align: right">632 ns</td>
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
    <td style="white-space: nowrap;text-align: right">37.76 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">36.87 M</td>
    <td style="white-space: nowrap; text-align: right">1.02x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">28.57 M</td>
    <td style="white-space: nowrap; text-align: right">1.32x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">27.00 M</td>
    <td style="white-space: nowrap; text-align: right">1.4x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">18.89 M</td>
    <td style="white-space: nowrap; text-align: right">2.0x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">16.70 M</td>
    <td style="white-space: nowrap; text-align: right">2.26x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">14.28 M</td>
    <td style="white-space: nowrap; text-align: right">2.64x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">10.38 M</td>
    <td style="white-space: nowrap; text-align: right">3.64x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.97 M</td>
    <td style="white-space: nowrap; text-align: right">3.79x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.17 M</td>
    <td style="white-space: nowrap; text-align: right">4.12x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">5.77 M</td>
    <td style="white-space: nowrap; text-align: right">6.54x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.64 M</td>
    <td style="white-space: nowrap; text-align: right">6.7x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">3.99 M</td>
    <td style="white-space: nowrap; text-align: right">9.46x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.46 M</td>
    <td style="white-space: nowrap; text-align: right">15.37x</td>
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
    <td style="white-space: nowrap; text-align: right">42.47 M</td>
    <td style="white-space: nowrap; text-align: right">23.55 ns</td>
    <td style="white-space: nowrap; text-align: right">±788.60%</td>
    <td style="white-space: nowrap; text-align: right">21 ns</td>
    <td style="white-space: nowrap; text-align: right">40 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">40.98 M</td>
    <td style="white-space: nowrap; text-align: right">24.40 ns</td>
    <td style="white-space: nowrap; text-align: right">±725.07%</td>
    <td style="white-space: nowrap; text-align: right">22 ns</td>
    <td style="white-space: nowrap; text-align: right">41 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">29.67 M</td>
    <td style="white-space: nowrap; text-align: right">33.70 ns</td>
    <td style="white-space: nowrap; text-align: right">±161.51%</td>
    <td style="white-space: nowrap; text-align: right">33 ns</td>
    <td style="white-space: nowrap; text-align: right">45 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">28.54 M</td>
    <td style="white-space: nowrap; text-align: right">35.03 ns</td>
    <td style="white-space: nowrap; text-align: right">±986.95%</td>
    <td style="white-space: nowrap; text-align: right">32 ns</td>
    <td style="white-space: nowrap; text-align: right">50 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">19.71 M</td>
    <td style="white-space: nowrap; text-align: right">50.73 ns</td>
    <td style="white-space: nowrap; text-align: right">±1279.45%</td>
    <td style="white-space: nowrap; text-align: right">47 ns</td>
    <td style="white-space: nowrap; text-align: right">65 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">17.88 M</td>
    <td style="white-space: nowrap; text-align: right">55.92 ns</td>
    <td style="white-space: nowrap; text-align: right">±85.10%</td>
    <td style="white-space: nowrap; text-align: right">52 ns</td>
    <td style="white-space: nowrap; text-align: right">80 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">13.28 M</td>
    <td style="white-space: nowrap; text-align: right">75.31 ns</td>
    <td style="white-space: nowrap; text-align: right">±32.34%</td>
    <td style="white-space: nowrap; text-align: right">73 ns</td>
    <td style="white-space: nowrap; text-align: right">126 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">12.12 M</td>
    <td style="white-space: nowrap; text-align: right">82.53 ns</td>
    <td style="white-space: nowrap; text-align: right">±31.49%</td>
    <td style="white-space: nowrap; text-align: right">80 ns</td>
    <td style="white-space: nowrap; text-align: right">126 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.90 M</td>
    <td style="white-space: nowrap; text-align: right">101.05 ns</td>
    <td style="white-space: nowrap; text-align: right">±16.04%</td>
    <td style="white-space: nowrap; text-align: right">99 ns</td>
    <td style="white-space: nowrap; text-align: right">135 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.85 M</td>
    <td style="white-space: nowrap; text-align: right">101.53 ns</td>
    <td style="white-space: nowrap; text-align: right">±19.29%</td>
    <td style="white-space: nowrap; text-align: right">99 ns</td>
    <td style="white-space: nowrap; text-align: right">136 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.59 M</td>
    <td style="white-space: nowrap; text-align: right">178.80 ns</td>
    <td style="white-space: nowrap; text-align: right">±41.70%</td>
    <td style="white-space: nowrap; text-align: right">169 ns</td>
    <td style="white-space: nowrap; text-align: right">394.49 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">4.09 M</td>
    <td style="white-space: nowrap; text-align: right">244.65 ns</td>
    <td style="white-space: nowrap; text-align: right">±16.85%</td>
    <td style="white-space: nowrap; text-align: right">242 ns</td>
    <td style="white-space: nowrap; text-align: right">299 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">3.76 M</td>
    <td style="white-space: nowrap; text-align: right">265.82 ns</td>
    <td style="white-space: nowrap; text-align: right">±35.71%</td>
    <td style="white-space: nowrap; text-align: right">251 ns</td>
    <td style="white-space: nowrap; text-align: right">486 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.38 M</td>
    <td style="white-space: nowrap; text-align: right">724.35 ns</td>
    <td style="white-space: nowrap; text-align: right">±10.88%</td>
    <td style="white-space: nowrap; text-align: right">715 ns</td>
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
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap;text-align: right">42.47 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">40.98 M</td>
    <td style="white-space: nowrap; text-align: right">1.04x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">29.67 M</td>
    <td style="white-space: nowrap; text-align: right">1.43x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">28.54 M</td>
    <td style="white-space: nowrap; text-align: right">1.49x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">19.71 M</td>
    <td style="white-space: nowrap; text-align: right">2.15x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">17.88 M</td>
    <td style="white-space: nowrap; text-align: right">2.37x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">13.28 M</td>
    <td style="white-space: nowrap; text-align: right">3.2x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">12.12 M</td>
    <td style="white-space: nowrap; text-align: right">3.5x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.90 M</td>
    <td style="white-space: nowrap; text-align: right">4.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.85 M</td>
    <td style="white-space: nowrap; text-align: right">4.31x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.59 M</td>
    <td style="white-space: nowrap; text-align: right">7.59x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">4.09 M</td>
    <td style="white-space: nowrap; text-align: right">10.39x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">3.76 M</td>
    <td style="white-space: nowrap; text-align: right">11.29x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.38 M</td>
    <td style="white-space: nowrap; text-align: right">30.76x</td>
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
    <td style="white-space: nowrap; text-align: right">31.04 M</td>
    <td style="white-space: nowrap; text-align: right">32.21 ns</td>
    <td style="white-space: nowrap; text-align: right">±59.43%</td>
    <td style="white-space: nowrap; text-align: right">30 ns</td>
    <td style="white-space: nowrap; text-align: right">91 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.91 M</td>
    <td style="white-space: nowrap; text-align: right">59.15 ns</td>
    <td style="white-space: nowrap; text-align: right">±2301.62%</td>
    <td style="white-space: nowrap; text-align: right">48 ns</td>
    <td style="white-space: nowrap; text-align: right">87 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">14.86 M</td>
    <td style="white-space: nowrap; text-align: right">67.31 ns</td>
    <td style="white-space: nowrap; text-align: right">±666.24%</td>
    <td style="white-space: nowrap; text-align: right">62 ns</td>
    <td style="white-space: nowrap; text-align: right">80 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">14.65 M</td>
    <td style="white-space: nowrap; text-align: right">68.24 ns</td>
    <td style="white-space: nowrap; text-align: right">±24850.94%</td>
    <td style="white-space: nowrap; text-align: right">33 ns</td>
    <td style="white-space: nowrap; text-align: right">88 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">12.04 M</td>
    <td style="white-space: nowrap; text-align: right">83.05 ns</td>
    <td style="white-space: nowrap; text-align: right">±5738.15%</td>
    <td style="white-space: nowrap; text-align: right">43 ns</td>
    <td style="white-space: nowrap; text-align: right">116 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">10.49 M</td>
    <td style="white-space: nowrap; text-align: right">95.30 ns</td>
    <td style="white-space: nowrap; text-align: right">±484.89%</td>
    <td style="white-space: nowrap; text-align: right">81 ns</td>
    <td style="white-space: nowrap; text-align: right">204 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">9.01 M</td>
    <td style="white-space: nowrap; text-align: right">111.00 ns</td>
    <td style="white-space: nowrap; text-align: right">±247.51%</td>
    <td style="white-space: nowrap; text-align: right">81 ns</td>
    <td style="white-space: nowrap; text-align: right">1388 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.75 M</td>
    <td style="white-space: nowrap; text-align: right">114.30 ns</td>
    <td style="white-space: nowrap; text-align: right">±19.08%</td>
    <td style="white-space: nowrap; text-align: right">112 ns</td>
    <td style="white-space: nowrap; text-align: right">142 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.65 M</td>
    <td style="white-space: nowrap; text-align: right">115.64 ns</td>
    <td style="white-space: nowrap; text-align: right">±16.84%</td>
    <td style="white-space: nowrap; text-align: right">111 ns</td>
    <td style="white-space: nowrap; text-align: right">151 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">6.87 M</td>
    <td style="white-space: nowrap; text-align: right">145.65 ns</td>
    <td style="white-space: nowrap; text-align: right">±195.37%</td>
    <td style="white-space: nowrap; text-align: right">121 ns</td>
    <td style="white-space: nowrap; text-align: right">174.11 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">6.73 M</td>
    <td style="white-space: nowrap; text-align: right">148.59 ns</td>
    <td style="white-space: nowrap; text-align: right">±31.02%</td>
    <td style="white-space: nowrap; text-align: right">145 ns</td>
    <td style="white-space: nowrap; text-align: right">237 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">5.77 M</td>
    <td style="white-space: nowrap; text-align: right">173.25 ns</td>
    <td style="white-space: nowrap; text-align: right">±1013.39%</td>
    <td style="white-space: nowrap; text-align: right">149 ns</td>
    <td style="white-space: nowrap; text-align: right">189 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.49 M</td>
    <td style="white-space: nowrap; text-align: right">182.25 ns</td>
    <td style="white-space: nowrap; text-align: right">±22.92%</td>
    <td style="white-space: nowrap; text-align: right">180 ns</td>
    <td style="white-space: nowrap; text-align: right">227.75 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.09 M</td>
    <td style="white-space: nowrap; text-align: right">244.47 ns</td>
    <td style="white-space: nowrap; text-align: right">±115.24%</td>
    <td style="white-space: nowrap; text-align: right">219 ns</td>
    <td style="white-space: nowrap; text-align: right">1051 ns</td>
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
    <td style="white-space: nowrap;text-align: right">31.04 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.91 M</td>
    <td style="white-space: nowrap; text-align: right">1.84x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">14.86 M</td>
    <td style="white-space: nowrap; text-align: right">2.09x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">14.65 M</td>
    <td style="white-space: nowrap; text-align: right">2.12x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">12.04 M</td>
    <td style="white-space: nowrap; text-align: right">2.58x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">10.49 M</td>
    <td style="white-space: nowrap; text-align: right">2.96x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">9.01 M</td>
    <td style="white-space: nowrap; text-align: right">3.45x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.75 M</td>
    <td style="white-space: nowrap; text-align: right">3.55x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.65 M</td>
    <td style="white-space: nowrap; text-align: right">3.59x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">6.87 M</td>
    <td style="white-space: nowrap; text-align: right">4.52x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">6.73 M</td>
    <td style="white-space: nowrap; text-align: right">4.61x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">5.77 M</td>
    <td style="white-space: nowrap; text-align: right">5.38x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.49 M</td>
    <td style="white-space: nowrap; text-align: right">5.66x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">4.09 M</td>
    <td style="white-space: nowrap; text-align: right">7.59x</td>
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
    <td style="white-space: nowrap; text-align: right">21.17 M</td>
    <td style="white-space: nowrap; text-align: right">47.25 ns</td>
    <td style="white-space: nowrap; text-align: right">±18021.59%</td>
    <td style="white-space: nowrap; text-align: right">24 ns</td>
    <td style="white-space: nowrap; text-align: right">55 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">20.96 M</td>
    <td style="white-space: nowrap; text-align: right">47.70 ns</td>
    <td style="white-space: nowrap; text-align: right">±4316.38%</td>
    <td style="white-space: nowrap; text-align: right">38 ns</td>
    <td style="white-space: nowrap; text-align: right">57 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">17.43 M</td>
    <td style="white-space: nowrap; text-align: right">57.36 ns</td>
    <td style="white-space: nowrap; text-align: right">±6745.68%</td>
    <td style="white-space: nowrap; text-align: right">46 ns</td>
    <td style="white-space: nowrap; text-align: right">62 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">12.43 M</td>
    <td style="white-space: nowrap; text-align: right">80.46 ns</td>
    <td style="white-space: nowrap; text-align: right">±8459.34%</td>
    <td style="white-space: nowrap; text-align: right">33 ns</td>
    <td style="white-space: nowrap; text-align: right">115 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.54 M</td>
    <td style="white-space: nowrap; text-align: right">104.85 ns</td>
    <td style="white-space: nowrap; text-align: right">±25.06%</td>
    <td style="white-space: nowrap; text-align: right">100 ns</td>
    <td style="white-space: nowrap; text-align: right">242.92 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.34 M</td>
    <td style="white-space: nowrap; text-align: right">107.08 ns</td>
    <td style="white-space: nowrap; text-align: right">±20.13%</td>
    <td style="white-space: nowrap; text-align: right">105 ns</td>
    <td style="white-space: nowrap; text-align: right">137 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">8.92 M</td>
    <td style="white-space: nowrap; text-align: right">112.14 ns</td>
    <td style="white-space: nowrap; text-align: right">±51.21%</td>
    <td style="white-space: nowrap; text-align: right">108 ns</td>
    <td style="white-space: nowrap; text-align: right">157 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">7.06 M</td>
    <td style="white-space: nowrap; text-align: right">141.62 ns</td>
    <td style="white-space: nowrap; text-align: right">±45.86%</td>
    <td style="white-space: nowrap; text-align: right">138 ns</td>
    <td style="white-space: nowrap; text-align: right">211 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">6.01 M</td>
    <td style="white-space: nowrap; text-align: right">166.46 ns</td>
    <td style="white-space: nowrap; text-align: right">±949.89%</td>
    <td style="white-space: nowrap; text-align: right">142 ns</td>
    <td style="white-space: nowrap; text-align: right">186 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.55 M</td>
    <td style="white-space: nowrap; text-align: right">180.21 ns</td>
    <td style="white-space: nowrap; text-align: right">±30.79%</td>
    <td style="white-space: nowrap; text-align: right">174 ns</td>
    <td style="white-space: nowrap; text-align: right">271.61 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">4.81 M</td>
    <td style="white-space: nowrap; text-align: right">207.77 ns</td>
    <td style="white-space: nowrap; text-align: right">±93.27%</td>
    <td style="white-space: nowrap; text-align: right">201 ns</td>
    <td style="white-space: nowrap; text-align: right">431 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">4.03 M</td>
    <td style="white-space: nowrap; text-align: right">247.92 ns</td>
    <td style="white-space: nowrap; text-align: right">±28.34%</td>
    <td style="white-space: nowrap; text-align: right">241 ns</td>
    <td style="white-space: nowrap; text-align: right">307 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.95 M</td>
    <td style="white-space: nowrap; text-align: right">253.35 ns</td>
    <td style="white-space: nowrap; text-align: right">±117.41%</td>
    <td style="white-space: nowrap; text-align: right">225 ns</td>
    <td style="white-space: nowrap; text-align: right">1053.34 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.80 M</td>
    <td style="white-space: nowrap; text-align: right">357.35 ns</td>
    <td style="white-space: nowrap; text-align: right">±94.13%</td>
    <td style="white-space: nowrap; text-align: right">342 ns</td>
    <td style="white-space: nowrap; text-align: right">611 ns</td>
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
    <td style="white-space: nowrap;text-align: right">21.17 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">20.96 M</td>
    <td style="white-space: nowrap; text-align: right">1.01x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">17.43 M</td>
    <td style="white-space: nowrap; text-align: right">1.21x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">12.43 M</td>
    <td style="white-space: nowrap; text-align: right">1.7x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">9.54 M</td>
    <td style="white-space: nowrap; text-align: right">2.22x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">9.34 M</td>
    <td style="white-space: nowrap; text-align: right">2.27x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">8.92 M</td>
    <td style="white-space: nowrap; text-align: right">2.37x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">7.06 M</td>
    <td style="white-space: nowrap; text-align: right">3.0x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">6.01 M</td>
    <td style="white-space: nowrap; text-align: right">3.52x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.55 M</td>
    <td style="white-space: nowrap; text-align: right">3.81x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">4.81 M</td>
    <td style="white-space: nowrap; text-align: right">4.4x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">4.03 M</td>
    <td style="white-space: nowrap; text-align: right">5.25x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.95 M</td>
    <td style="white-space: nowrap; text-align: right">5.36x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">2.80 M</td>
    <td style="white-space: nowrap; text-align: right">7.56x</td>
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
    <td style="white-space: nowrap">Tuple2D</td>
    <td style="white-space: nowrap; text-align: right">16.87 M</td>
    <td style="white-space: nowrap; text-align: right">59.28 ns</td>
    <td style="white-space: nowrap; text-align: right">±2026.15%</td>
    <td style="white-space: nowrap; text-align: right">51 ns</td>
    <td style="white-space: nowrap; text-align: right">70 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">14.36 M</td>
    <td style="white-space: nowrap; text-align: right">69.65 ns</td>
    <td style="white-space: nowrap; text-align: right">±4696.55%</td>
    <td style="white-space: nowrap; text-align: right">59 ns</td>
    <td style="white-space: nowrap; text-align: right">75 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">12.16 M</td>
    <td style="white-space: nowrap; text-align: right">82.24 ns</td>
    <td style="white-space: nowrap; text-align: right">±23284.12%</td>
    <td style="white-space: nowrap; text-align: right">36 ns</td>
    <td style="white-space: nowrap; text-align: right">67 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">10.67 M</td>
    <td style="white-space: nowrap; text-align: right">93.74 ns</td>
    <td style="white-space: nowrap; text-align: right">±7351.11%</td>
    <td style="white-space: nowrap; text-align: right">46 ns</td>
    <td style="white-space: nowrap; text-align: right">111 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">8.92 M</td>
    <td style="white-space: nowrap; text-align: right">112.16 ns</td>
    <td style="white-space: nowrap; text-align: right">±42.16%</td>
    <td style="white-space: nowrap; text-align: right">110 ns</td>
    <td style="white-space: nowrap; text-align: right">158 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.77 M</td>
    <td style="white-space: nowrap; text-align: right">114.03 ns</td>
    <td style="white-space: nowrap; text-align: right">±22.42%</td>
    <td style="white-space: nowrap; text-align: right">111 ns</td>
    <td style="white-space: nowrap; text-align: right">148 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.58 M</td>
    <td style="white-space: nowrap; text-align: right">116.53 ns</td>
    <td style="white-space: nowrap; text-align: right">±17.78%</td>
    <td style="white-space: nowrap; text-align: right">114 ns</td>
    <td style="white-space: nowrap; text-align: right">145 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">6.58 M</td>
    <td style="white-space: nowrap; text-align: right">152.06 ns</td>
    <td style="white-space: nowrap; text-align: right">±35.69%</td>
    <td style="white-space: nowrap; text-align: right">148 ns</td>
    <td style="white-space: nowrap; text-align: right">245 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">5.63 M</td>
    <td style="white-space: nowrap; text-align: right">177.74 ns</td>
    <td style="white-space: nowrap; text-align: right">±978.38%</td>
    <td style="white-space: nowrap; text-align: right">154 ns</td>
    <td style="white-space: nowrap; text-align: right">202 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.34 M</td>
    <td style="white-space: nowrap; text-align: right">187.42 ns</td>
    <td style="white-space: nowrap; text-align: right">±38.95%</td>
    <td style="white-space: nowrap; text-align: right">183 ns</td>
    <td style="white-space: nowrap; text-align: right">228 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.50 M</td>
    <td style="white-space: nowrap; text-align: right">285.55 ns</td>
    <td style="white-space: nowrap; text-align: right">±100.73%</td>
    <td style="white-space: nowrap; text-align: right">260 ns</td>
    <td style="white-space: nowrap; text-align: right">1090 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">2.89 M</td>
    <td style="white-space: nowrap; text-align: right">345.55 ns</td>
    <td style="white-space: nowrap; text-align: right">±24.43%</td>
    <td style="white-space: nowrap; text-align: right">328 ns</td>
    <td style="white-space: nowrap; text-align: right">587.01 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">2.62 M</td>
    <td style="white-space: nowrap; text-align: right">381.31 ns</td>
    <td style="white-space: nowrap; text-align: right">±16.51%</td>
    <td style="white-space: nowrap; text-align: right">375 ns</td>
    <td style="white-space: nowrap; text-align: right">436 ns</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.35 M</td>
    <td style="white-space: nowrap; text-align: right">739.31 ns</td>
    <td style="white-space: nowrap; text-align: right">±147.87%</td>
    <td style="white-space: nowrap; text-align: right">705 ns</td>
    <td style="white-space: nowrap; text-align: right">1340.80 ns</td>
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
    <td style="white-space: nowrap;text-align: right">16.87 M</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ProcessDictionary</td>
    <td style="white-space: nowrap; text-align: right">14.36 M</td>
    <td style="white-space: nowrap; text-align: right">1.17x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTuple</td>
    <td style="white-space: nowrap; text-align: right">12.16 M</td>
    <td style="white-space: nowrap; text-align: right">1.39x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Tuple1D</td>
    <td style="white-space: nowrap; text-align: right">10.67 M</td>
    <td style="white-space: nowrap; text-align: right">1.58x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleHalfFull</td>
    <td style="white-space: nowrap; text-align: right">8.92 M</td>
    <td style="white-space: nowrap; text-align: right">1.89x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleFull</td>
    <td style="white-space: nowrap; text-align: right">8.77 M</td>
    <td style="white-space: nowrap; text-align: right">1.92x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSSet</td>
    <td style="white-space: nowrap; text-align: right">8.58 M</td>
    <td style="white-space: nowrap; text-align: right">1.97x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array2D</td>
    <td style="white-space: nowrap; text-align: right">6.58 M</td>
    <td style="white-space: nowrap; text-align: right">2.57x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Array1D</td>
    <td style="white-space: nowrap; text-align: right">5.63 M</td>
    <td style="white-space: nowrap; text-align: right">3.0x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">ETSOrderedSet</td>
    <td style="white-space: nowrap; text-align: right">5.34 M</td>
    <td style="white-space: nowrap; text-align: right">3.16x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">Map2D</td>
    <td style="white-space: nowrap; text-align: right">3.50 M</td>
    <td style="white-space: nowrap; text-align: right">4.82x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List2D</td>
    <td style="white-space: nowrap; text-align: right">2.89 M</td>
    <td style="white-space: nowrap; text-align: right">5.83x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">MapTupleQuarterFull</td>
    <td style="white-space: nowrap; text-align: right">2.62 M</td>
    <td style="white-space: nowrap; text-align: right">6.43x</td>
  </tr>
  <tr>
    <td style="white-space: nowrap">List1D</td>
    <td style="white-space: nowrap; text-align: right">1.35 M</td>
    <td style="white-space: nowrap; text-align: right">12.47x</td>
  </tr>
</table>


<hr/>
