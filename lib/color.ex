defmodule Color do
  @moduledoc false

  def convert(depth, max) do
    t = depth / max
    c1 = {:rgb, 255,255,255}
    c2 = {:rgb, 75,0,150}
    cond do
      depth == 0 -> {:rgb, 50,0,100}
      t < 0.2 -> interpolate(c1,c2,0, 0.2, t)
      true -> interpolate(c1,c2, 0, 0.8,1-t)
    end

#    cond do
#      depth == 0 -> {:rgb, 0, 0, 0}
#      depth / max < 0.1 -> {:rgb, 255, 255, 255}
#      depth / max < 0.5 -> {:rgb, 0, 255, 0}
#      depth / max < 0.75 -> {:rgb, 0, 0, 255}
#      depth / max < 1 -> {:rgb, 255, 0, 0}
#    end
  end

  def interpolate({:rgb, r1, g1, b1}, {:rgb, r2, g2, b2}, lb, hb, t) do
    t = (t-lb)/(hb-lb)
    {:rgb, round((1-t)*r1 + t*r2),
      round((1-t)*g1 + t*g2),
      round((1-t)*b1 + t*b2)}
  end

end
