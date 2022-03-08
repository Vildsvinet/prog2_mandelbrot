defmodule Brot do
  @moduledoc false

  def mandelbrot(c, depth) do
    z0 = Cmplx.new(0, 0)
    it = 0
    test(it, z0, c, depth)
  end

  def test(it, z, c, depth) do
#    {ac, bc} = c
#    {az, bz} = Cmplx.square(z)
    cond do
      it == depth -> 0
      Cmplx.abs(z) > 2 -> it
#      true -> test(it+1, {ac+az, bc+bz}, c, depth)
      true -> test(it+1, Cmplx.add(Cmplx.square(z), c), c, depth)
    end
  end

end
