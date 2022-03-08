defmodule Printout do
  @moduledoc false

  def bench(n) do
    for i <- 1..n do
      depth = Brot.mandelbrot(Cmplx.new(i/10, 0), 30)
      IO.puts(" depth = #{depth}")
    end
  end

end
