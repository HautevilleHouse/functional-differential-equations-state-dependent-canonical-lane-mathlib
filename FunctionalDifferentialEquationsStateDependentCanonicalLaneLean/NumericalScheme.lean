import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuncDiffEqStateDependent.DelayDifferentialEquation

namespace HautevilleHouse
namespace FuncDiffEqStateDependent

structure NumericalScheme {O : StateDependentOperator} (D : DelayDifferentialEquation O) where
  discretization : Type u
  stepSize : ℝ
  consistencyOrder : ℕ
  stabilityCondition : Prop
  convergenceProof : Prop
  stabilityConditionTerm : stabilityCondition
  convergenceProofTerm : convergenceProof

structure NumericalSchemeEvidence {O : StateDependentOperator} {D : DelayDifferentialEquation O}
    (N : NumericalScheme D) where
  stabilityConditionClosed : N.stabilityCondition
  convergenceProofClosed : N.convergenceProof

def NumericalSchemeClosed {O : StateDependentOperator} {D : DelayDifferentialEquation O}
    (N : NumericalScheme D) : Prop :=
  N.stabilityCondition ∧ N.convergenceProof

theorem numerical_scheme_closed_from_evidence
    {O : StateDependentOperator} {D : DelayDifferentialEquation O}
    (N : NumericalScheme D) (E : NumericalSchemeEvidence N) : NumericalSchemeClosed N := by
  exact And.intro E.stabilityConditionClosed E.convergenceProofClosed

end FuncDiffEqStateDependent
end HautevilleHouse