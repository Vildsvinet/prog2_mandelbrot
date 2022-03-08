defmodule Mandel do
  @moduledoc false

  # x: -2.6, y: 1.2,
  def mandelbrot(width, height, x, y, k, depth) do
    trans = fn (w, h) ->
      Cmplx.new(x + k * (w - 1), y - k * (h - 1))
    end
    Enum.reverse(rows(width, height, trans, depth))
  end

  #  def rows(, _,_,_,_), do: rws
  def rows(_, -1, _, _), do: []
  def rows(w, h, trans, depth) do
    [Enum.reverse(row(w, h, trans, depth)) | rows(w, h - 1, trans, depth)]
  end

  def row(-1, _, _, _), do: []
  def row(w, h, trans, depth) do
    zd = Brot.mandelbrot(trans.(w, h), depth)
    zcolor = Color.convert(zd, depth)
    [zcolor | row(w - 1, h, trans, depth)]
  end


end
