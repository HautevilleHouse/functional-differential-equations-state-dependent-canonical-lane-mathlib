import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.SolutionStructure

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure NumericalApproximation {S : StateSpace X} {D : DelayEquation S} (Sol : SolutionStructure D) where
  discretizationScheme : Type u
  consistencyOrder : Prop
  stabilityOrder : Prop
  convergenceGuarantee : Prop
  errorBound : Prop

structure NumericalApproximationEvidence {S : StateSpace X} {D : DelayEquation S}
    {Sol : SolutionStructure D} (Num : NumericalApproximation Sol) where
  consistencyOrderClosed : Num.consistencyOrder
  stabilityOrderClosed : Num.stabilityOrder
  convergenceGuaranteeClosed : Num.convergenceGuarantee
  errorBoundClosed : Num.errorBound

def NumericalApproximationClosed {S : StateSpace X} {D : DelayEquation S}
    {Sol : SolutionStructure D} (Num : NumericalApproximation Sol) : Prop :=
  Num.consistencyOrder ∧ Num.stabilityOrder ∧ Num.convergenceGuarantee ∧ Num.errorBound

theorem numerical_approximation_closed_from_evidence {S : StateSpace X} {D : DelayEquation S}
    {Sol : SolutionStructure D} (Num : NumericalApproximation Sol)
    (E : NumericalApproximationEvidence Num) : NumericalApproximationClosed Num := by
  exact And.intro E.consistencyOrderClosed
    (And.intro E.stabilityOrderClosed
      (And.intro E.convergenceGuaranteeClosed E.errorBoundClosed))

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse
