hs105_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs105",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_hs105_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_hs105_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs105_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs105_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs105_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs105_nineq(; n::Integer = default_nvar, kwargs...) = 1
