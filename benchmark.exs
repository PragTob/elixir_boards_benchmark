defmodule BoardBenchmarkMacro do
  # Why macros?
  # Repetition got very annoying quickly in those benchmarks. Non macro benchmarks had too much of an overhead for the times we want to measure here (sub 20 ns sometimes), presumably because the module had to be looked up with non macro approaches at reducing the repetition.
  # Also I wanted it to be easy to add new implementations. Now it's as easy as adding one to these @board_modules here.

  # Add your implementation here:
  @board_modules [
    Board.List1D,
    Board.List2D,
    Board.MapTuple,
    Board.MapTupleHalfFull,
    Board.MapTupleQuarterFull,
    Board.MapTupleFull,
    Board.Map2D,
    Board.Tuple1D,
    Board.Tuple2D,
    Board.ETSSet,
    Board.ETSOrderedSet
  ]

  defmacro get(x, y) do
    Enum.map(@board_modules, fn module ->
      name = short_module_name(module)

      quote do
        {unquote(name),
         {fn board ->
            unquote(module).get(
              board,
              unquote(x),
              unquote(y)
            )
          end, before_each: fn _ -> unquote(module).new end}}
      end
    end)
  end

  defmacro set(x, y, value) do
    Enum.map(@board_modules, fn module ->
      name = short_module_name(module)

      quote do
        {unquote(name),
         {fn board ->
            unquote(module).set(
              board,
              unquote(x),
              unquote(y),
              unquote(value)
            )
          end, before_each: fn _ -> unquote(module).new end}}
      end
    end)
  end

  defmacro getting_and_setting_full_board do
    Enum.map(@board_modules, fn module ->
      name = short_module_name(module)

      quote do
        {unquote(name),
         {fn board ->
            # maping so it sholdn't potentially optimize away return values
            Enum.flat_map(0..8, fn x ->
              Enum.map(0..8, fn y ->
                board = unquote(module).set(board, x, y, :value)
                unquote(module).get(board, x, y)
              end)
            end)
          end, before_each: fn _ -> unquote(module).new end}}
      end
    end)
  end

  defmacro mixed_bag() do
    Enum.map(@board_modules, fn module ->
      name = short_module_name(module)

      quote do
        {unquote(name),
         {fn board ->
            new_board =
              board
              |> unquote(module).set(0, 0, :boing)
              |> unquote(module).set(4, 4, :boing)
              |> unquote(module).set(8, 8, :boing)

            val1 = unquote(module).get(board, 0, 0)
            val2 = unquote(module).get(board, 4, 4)
            val3 = unquote(module).get(board, 8, 8)

            # assign and return so no fancy potential compiler optimization could go "woops you don't need those"
            {val1, val2, val3}
          end, before_each: fn _ -> unquote(module).new end}}
      end
    end)
  end

  def short_module_name(module) do
    module
    |> to_string()
    |> String.split(".")
    |> List.last()
  end
end

defmodule BoardBenchmark do
  require BoardBenchmarkMacro
  import BoardBenchmarkMacro
  alias Benchee.Formatters.{Console, HTML, Markdown}

  # can't use macros top level if defined in the same context and I want to use them in the same context, hence this "main" method
  def main do
    headline("Getting and setting full board")

    # times are rather small as our measurements are very fast, so we get good sample sizes
    # plus the HTML formatter/the JS part of it gets problems with big data sets and slows to a crawl
    Benchee.run(getting_and_setting_full_board(),
      time: 2,
      warmup: 0.5,
      memory_time: 0.1,
      formatters: [
        {Console, extended_statistics: true},
        {HTML, file: "output/html/getting_and_setting_full_board.html", auto_open: false},
        {Markdown, file: "output/md/getting_and_setting_full_board.md"}
      ]
    )

    Enum.each([{0, 0}, {4, 4}, {8, 8}], fn {x, y} ->
      headline("get(#{x}, #{y})")

      Benchee.run(get(x, y),
        time: 0.3,
        warmup: 0.1,
        print: [benchmarking: false, configuration: false],
        formatters: [
          Console,
          {HTML, file: "output/html/get_#{x}_#{y}.html", auto_open: false},
          {Markdown, file: "output/md/get_#{x}_#{y}.md"}
        ]
      )
    end)

    Enum.each([{0, 0}, {4, 4}, {8, 8}], fn {x, y} ->
      headline("set(#{x}, #{y}, :boom)")

      Benchee.run(set(x, y, :boom),
        time: 0.3,
        warmup: 0.1,
        print: [benchmarking: false, configuration: false],
        formatters: [
          Console,
          {HTML, file: "output/html/set_#{x}_#{y}.html", auto_open: false},
          {Markdown, file: "output/md/set_#{x}_#{y}.md"}
        ]
      )
    end)

    headline("mixed bag (3 sets, 3 gets)")

    Benchee.run(mixed_bag(),
      time: 0.3,
      warmup: 0.1,
      memory_time: 0.01,
      print: [benchmarking: false, configuration: false],
      formatters: [
        {Console, extended_statistics: true},
        {HTML, file: "output/html/mixed_bag.html", auto_open: false},
        {Markdown, file: "output/md/mixed_bag.md"}
      ]
    )
  end

  def headline(text) do
    IO.puts("""

    ================= #{text} ====================

    """)
  end
end

BoardBenchmark.main()
