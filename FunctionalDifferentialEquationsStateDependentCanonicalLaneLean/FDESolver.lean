import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure FDESolution where
  solution : ℝ → ℝ
  continuous : Prop
  piecewiseDifferentiable : Prop
  satisfiesEquation : Prop

def FDEClosed (S : FDESolution) : Prop :=
  S.continuous ∧ S.piecewiseDifferentiable ∧ S.satisfiesEquation

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse
