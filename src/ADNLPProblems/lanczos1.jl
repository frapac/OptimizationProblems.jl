export lanczos1

function lanczos1(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return lanczos1(Val(model); kwargs...)
end

function lanczos1(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    2.513400000000E+00 0.000000000000E+00
    2.044333373291E+00 5.000000000000E-02
    1.668404436564E+00 1.000000000000E-01
    1.366418021208E+00 1.500000000000E-01
    1.123232487372E+00 2.000000000000E-01
    9.268897180037E-01 2.500000000000E-01
    7.679338563728E-01 3.000000000000E-01
    6.388775523106E-01 3.500000000000E-01
    5.337835317402E-01 4.000000000000E-01
    4.479363617347E-01 4.500000000000E-01
    3.775847884350E-01 5.000000000000E-01
    3.197393199326E-01 5.500000000000E-01
    2.720130773746E-01 6.000000000000E-01
    2.324965529032E-01 6.500000000000E-01
    1.996589546065E-01 7.000000000000E-01
    1.722704126914E-01 7.500000000000E-01
    1.493405660168E-01 8.000000000000E-01
    1.300700206922E-01 8.500000000000E-01
    1.138119324644E-01 9.000000000000E-01
    1.000415587559E-01 9.500000000000E-01
    8.833209084540E-02 1.000000000000E+00
    7.833544019350E-02 1.050000000000E+00
    6.976693743449E-02 1.100000000000E+00
    6.239312536719E-02 1.150000000000E+00
  ]
  function f(x; y = y)
    return 1 // 2 * sum(
      (
        y[i, 1] -
        (x[1] * exp(-x[2] * y[i, 2]) + x[3] * exp(-x[4] * y[i, 2]) + x[5] * exp(-x[6] * y[i, 2]))
      )^2 for i = 1:24
    )
  end
  x0 = T[1.2, 0.3, 5.6, 5.5, 6.5, 7.6]
  return ADNLPModels.ADNLPModel(f, x0, name = "lanczos1"; kwargs...)
end

function lanczos1(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    2.513400000000E+00 0.000000000000E+00
    2.044333373291E+00 5.000000000000E-02
    1.668404436564E+00 1.000000000000E-01
    1.366418021208E+00 1.500000000000E-01
    1.123232487372E+00 2.000000000000E-01
    9.268897180037E-01 2.500000000000E-01
    7.679338563728E-01 3.000000000000E-01
    6.388775523106E-01 3.500000000000E-01
    5.337835317402E-01 4.000000000000E-01
    4.479363617347E-01 4.500000000000E-01
    3.775847884350E-01 5.000000000000E-01
    3.197393199326E-01 5.500000000000E-01
    2.720130773746E-01 6.000000000000E-01
    2.324965529032E-01 6.500000000000E-01
    1.996589546065E-01 7.000000000000E-01
    1.722704126914E-01 7.500000000000E-01
    1.493405660168E-01 8.000000000000E-01
    1.300700206922E-01 8.500000000000E-01
    1.138119324644E-01 9.000000000000E-01
    1.000415587559E-01 9.500000000000E-01
    8.833209084540E-02 1.000000000000E+00
    7.833544019350E-02 1.050000000000E+00
    6.976693743449E-02 1.100000000000E+00
    6.239312536719E-02 1.150000000000E+00
  ]
  function F!(r, x)
    m = 24
    for i = 1:m
      r[i] =
        y[i, 1] -
        (x[1] * exp(-x[2] * y[i, 2]) + x[3] * exp(-x[4] * y[i, 2]) + x[5] * exp(-x[6] * y[i, 2]))
    end
    return r
  end
  x0 = T[1.2, 0.3, 5.6, 5.5, 6.5, 7.6]
  return ADNLPModels.ADNLSModel!(F!, x0, 24, name = "lanczos1-nls"; kwargs...)
end
