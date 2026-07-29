import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure StateDependentDelayEquationPackage where
  stateSpace : Type u
  stateTopology : TopologicalSpace stateSpace
  delayFunction : stateSpace → ℝ
  functionalF : (stateSpace → ℝ) → ℝ → stateSpace
  continuityCondition : Prop
  delaySmoothness : Prop
  functionalCondition : Prop
  initialCondition : Prop

structure StateDependentDelayEquationEvidence (P : StateDependentDelayEquationPackage) where
  continuityConditionClosed : P.continuityCondition
  delaySmoothnessClosed : P.delaySmoothness
  functionalConditionClosed : P.functionalCondition
  initialConditionClosed : P.initialCondition

def StateDependentDelayEquationClosed (P : StateDependentDelayEquationPackage) : Prop :=
  P.continuityCondition ∧ P.delaySmoothness ∧ P.functionalCondition ∧ P.initialCondition

theorem state_dependent_delay_equation_closed_from_evidence
    (P : StateDependentDelayEquationPackage) (E : StateDependentDelayEquationEvidence P) :
    StateDependentDelayEquationClosed P := by
  exact And.intro E.continuityConditionClosed
    (And.intro E.delaySmoothnessClosed
      (And.intro E.functionalConditionClosed E.initialConditionClosed))

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse