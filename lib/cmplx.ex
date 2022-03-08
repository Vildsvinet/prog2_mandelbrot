defmodule Cmplx do
  @moduledoc false

  def new(a,b), do: {a, b}

  def add({az, bz}, {aw, bw}), do: {az + aw, bz + bw}

  def square({a, b}), do: {a*a - b*b, 2*a*b}

  def abs({a, b}), do: :math.sqrt(a*a + b*b)

end