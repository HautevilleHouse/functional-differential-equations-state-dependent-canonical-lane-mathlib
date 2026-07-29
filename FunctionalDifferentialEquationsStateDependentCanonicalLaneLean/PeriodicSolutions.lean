import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.SolutionExistencePackage

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure PeriodicSolutionsPackage {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E} where
  periodicSolutionExistence : Prop
  periodCharacterization : Prop
  stabilityOfPeriodicOrbit : Prop
  continuationCondition : Prop

structure PeriodicSolutionsEvidence {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E}
    (R : PeriodicSolutionsPackage S) where
  periodicSolutionExistenceClosed : R.periodicSolutionExistence
  periodCharacterizationClosed : R.periodCharacterization
  stabilityOfPeriodicOrbitClosed : R.stabilityOfPeriodicOrbit
  continuationConditionClosed : R.continuationCondition

def PeriodicSolutionsClosed {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E}
    (R : PeriodicSolutionsPackage S) : Prop :=
  R.periodicSolutionExistence ∧ R.periodCharacterization ∧
  R.stabilityOfPeriodicOrbit ∧ R.continuationCondition

theorem periodic_solutions_closed_from_evidence
    {P : StateDependentDelayEquationPackage} {E : StateDependentDelayEquationEvidence P}
    {S : SolutionExistencePackage E} (R : PeriodicSolutionsPackage S)
    (Ev : PeriodicSolutionsEvidence R) : PeriodicSolutionsClosed R := by
  exact And.intro Ev.periodicSolutionExistenceClosed
    (And.intro Ev.periodCharacterizationClosed
      (And.intro Ev.stabilityOfPeriodicOrbitClosed Ev.continuationConditionClosed))

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse