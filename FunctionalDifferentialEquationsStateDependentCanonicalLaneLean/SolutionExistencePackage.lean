import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.StateDependentDelayEquation

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure SolutionExistencePackage {P : StateDependentDelayEquationPackage}
    (E : StateDependentDelayEquationEvidence P) where
  localExistence : Prop
  uniqueness : Prop
  maximalExtension : Prop
  continuousDependence : Prop

structure SolutionExistenceEvidence {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} (S : SolutionExistencePackage E) where
  localExistenceClosed : S.localExistence
  uniquenessClosed : S.uniqueness
  maximalExtensionClosed : S.maximalExtension
  continuousDependenceClosed : S.continuousDependence

def SolutionExistenceClosed {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} (S : SolutionExistencePackage E) : Prop :=
  S.localExistence ∧ S.uniqueness ∧ S.maximalExtension ∧ S.continuousDependence

theorem solution_existence_closed_from_evidence
    {P : StateDependentDelayEquationPackage} {E : StateDependentDelayEquationEvidence P}
    (S : SolutionExistencePackage E) (Ev : SolutionExistenceEvidence S) :
    SolutionExistenceClosed S := by
  exact And.intro Ev.localExistenceClosed
    (And.intro Ev.uniquenessClosed
      (And.intro Ev.maximalExtensionClosed Ev.continuousDependenceClosed))

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse