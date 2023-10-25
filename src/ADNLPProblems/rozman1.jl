export rozman1

function rozman1(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return rozman1(Val(model); kwargs...)
end

function rozman1(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    0.252429 -4868.68
    0.252141 -4868.09
    0.251809 -4867.41
    0.297989 -3375.19
    0.296257 -3373.14
    0.295319 -3372.03
    0.339603 -2473.74
    0.337731 -2472.35
    0.333820 -2469.45
    0.389510 -1894.65
    0.386998 -1893.40
    0.438864 -1497.24
    0.434887 -1495.85
    0.427893 -1493.41
    0.471568 -1208.68
    0.461699 -1206.18
    0.461144 -1206.04
    0.513532 -997.92
    0.506641 -996.61
    0.505062 -996.31
    0.535648 -834.94
    0.533726 -834.66
    0.568064 -710.03
    0.612886 -530.16
    0.624169 -464.17
  ]
  function f(x; y = y)
    return 1 // 2 * sum(
      (y[i, 1] - (x[1] - x[2] * y[i, 2] - atan(x[3] / (y[i, 2] - x[4])) / pi))^2 for i = 1:25
    )
  end
  x0 = T[0.1, -0.00001, 1000, -100]
  return ADNLPModels.ADNLPModel(f, x0, name = "rozman1"; kwargs...)
end

function rozman1(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    0.252429 -4868.68
    0.252141 -4868.09
    0.251809 -4867.41
    0.297989 -3375.19
    0.296257 -3373.14
    0.295319 -3372.03
    0.339603 -2473.74
    0.337731 -2472.35
    0.333820 -2469.45
    0.389510 -1894.65
    0.386998 -1893.40
    0.438864 -1497.24
    0.434887 -1495.85
    0.427893 -1493.41
    0.471568 -1208.68
    0.461699 -1206.18
    0.461144 -1206.04
    0.513532 -997.92
    0.506641 -996.61
    0.505062 -996.31
    0.535648 -834.94
    0.533726 -834.66
    0.568064 -710.03
    0.612886 -530.16
    0.624169 -464.17
  ]
  function F!(r, x)
    m = 25
    for i = 1:m
      r[i] = y[i, 1] - (x[1] - x[2] * y[i, 2] - atan(x[3] / (y[i, 2] - x[4])) / pi)
    end
    return r
  end
  x0 = T[0.1, -0.00001, 1000, -100]
  return ADNLPModels.ADNLSModel!(F!, x0, 25, name = "rozman1-nls"; kwargs...)
end
