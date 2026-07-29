import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure BifurcationPoint where
  parameterValue : ℝ
  solutionBranch : ℝ → ℝ
  stabilityChange : Prop

def BifurcationClosed (B : BifurcationPoint) : Prop :=
  B.stabilityChange

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse
