import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure StateDependentDelayFunctional where
  stateSpace : Type u
  delayFunction : stateSpace → ℝ → ℝ
  continuity : Prop
  boundedness : Prop
  initialCondition : stateSpace

def SDDClosed (S : StateDependentDelayFunctional) : Prop :=
  S.continuity ∧ S.boundedness

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse
