defmodule Brot do
  @moduledoc false

  def mandelbrot(c, maxit) do
    z0 = Cmplx.new(0, 0)
    it = 0
    test(it, z0, c, maxit)
  end

  def test(it, z0, c, maxit) do
    {ac, bc} = c
    {az, bz} = Cmplx.square(z0)
    cond do
      it == maxit -> 0
      Cmplx.abs(z0) > 2 -> it
      true -> test(it+1, {ac+az, bc+bz}, c, maxit)
    end
  end

end
