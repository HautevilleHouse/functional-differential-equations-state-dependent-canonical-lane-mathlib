import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.DelayEquation

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure SolutionStructure {S : StateSpace X} (D : DelayEquation S) where
  solutionSpace : Type u
  existenceInterval : Prop
  uniquenessUnderContinuity : Prop
  continuousDependence : Prop
  smoothnessProps : Prop

structure SolutionStructureEvidence {S : StateSpace X} {D : DelayEquation S}
    (Sol : SolutionStructure D) where
  existenceIntervalClosed : Sol.existenceInterval
  uniquenessUnderContinuityClosed : Sol.uniquenessUnderContinuity
  continuousDependenceClosed : Sol.continuousDependence
  smoothnessPropsClosed : Sol.smoothnessProps

def SolutionStructureClosed {S : StateSpace X} {D : DelayEquation S}
    (Sol : SolutionStructure D) : Prop :=
  Sol.existenceInterval ∧ Sol.uniquenessUnderContinuity ∧
  Sol.continuousDependence ∧ Sol.smoothnessProps

theorem solution_structure_closed_from_evidence {S : StateSpace X} {D : DelayEquation S}
    (Sol : SolutionStructure D) (E : SolutionStructureEvidence Sol) :
    SolutionStructureClosed Sol := by
  exact And.intro E.existenceIntervalClosed
    (And.intro E.uniquenessUnderContinuityClosed
      (And.intro E.continuousDependenceClosed E.smoothnessPropsClosed))

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse
