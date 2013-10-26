defmodule Tennis.Mixfile do
  use Mix.Project

  def project do
    [ app: :tennis,
      version: "0.0.1",
      elixir: "~> 0.10.3",
      deps: deps ]
  end

  def application do
    [mod: { Tennis, [] }]
  end

  defp deps do
    [
      { :amrita, "~> 0.2", github: "josephwilk/amrita" }
    ]
  end
end
