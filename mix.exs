defmodule ElixirBoardsBenchmark.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_boards_benchmark,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:benchee, "~> 1.0"},
      {:benchee_html, "~> 1.0"},
      {:benchee_markdown, "~> 0.2"}
    ]
  end
end
