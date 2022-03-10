defmodule Color do
  @moduledoc false


  def convert(depth, max) do
    t = depth / max
    c2 = {:rgb, 255, 255, 255}
    c1 = {:rgb, 75, 0, 150}
    cond do
      depth == 0 -> {:rgb, 150, 100, 200}
      t < 0.2 -> interpolate(c1, c2, 0, 0.2, t)
      true -> interpolate(c1, c2, 0, 0.8, 1 - t)
    end
  end

  def interpolate({:rgb, r1, g1, b1}, {:rgb, r2, g2, b2}, lb, hb, t) do
    t = (t - lb) / (hb - lb)
    {
      :rgb,
      round((1 - t) * r1 + t * r2),
      round((1 - t) * g1 + t * g2),
      round((1 - t) * b1 + t * b2)
    }
  end


end
