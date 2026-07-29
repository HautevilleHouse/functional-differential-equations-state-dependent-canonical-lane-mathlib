import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuncDiffEqStateDependent.StateDependentOperator

namespace HautevilleHouse
namespace FuncDiffEqStateDependent

structure DelayDifferentialEquation (O : StateDependentOperator) where
  initialState : O.stateSpace
  timeDomain : Set ℝ
  solution : ℝ → O.stateSpace
  satisfiesEquation : Prop
  uniqueness : Prop
  continuousDependence : Prop
  satisfiesEquationTerm : satisfiesEquation
  uniquenessTerm : uniqueness
  continuousDependenceTerm : continuousDependence

structure DelayDifferentialEquationEvidence {O : StateDependentOperator}
    (D : DelayDifferentialEquation O) where
  satisfiesEquationClosed : D.satisfiesEquation
  uniquenessClosed : D.uniqueness
  continuousDependenceClosed : D.continuousDependence

def DelayDifferentialEquationClosed {O : StateDependentOperator}
    (D : DelayDifferentialEquation O) : Prop :=
  D.satisfiesEquation ∧ D.uniqueness ∧ D.continuousDependence

theorem delay_differential_equation_closed_from_evidence
    {O : StateDependentOperator} (D : DelayDifferentialEquation O)
    (E : DelayDifferentialEquationEvidence D) : DelayDifferentialEquationClosed D := by
  exact And.intro E.satisfiesEquationClosed (And.intro E.uniquenessClosed E.continuousDependenceClosed)

end FuncDiffEqStateDependent
end HautevilleHouse