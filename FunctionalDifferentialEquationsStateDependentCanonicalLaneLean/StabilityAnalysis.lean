import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.SolutionExistencePackage

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure StabilityAnalysisPackage {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E} where
  equilibriumExistence : Prop
  stabilityCondition : Prop
  attractionBasin : Prop
  lyapunovFunctional : Prop

structure StabilityAnalysisEvidence {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E}
    (A : StabilityAnalysisPackage S) where
  equilibriumExistenceClosed : A.equilibriumExistence
  stabilityConditionClosed : A.stabilityCondition
  attractionBasinClosed : A.attractionBasin
  lyapunovFunctionalClosed : A.lyapunovFunctional

def StabilityAnalysisClosed {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E}
    (A : StabilityAnalysisPackage S) : Prop :=
  A.equilibriumExistence ∧ A.stabilityCondition ∧ A.attractionBasin ∧ A.lyapunovFunctional

theorem stability_analysis_closed_from_evidence
    {P : StateDependentDelayEquationPackage} {E : StateDependentDelayEquationEvidence P}
    {S : SolutionExistencePackage E} (A : StabilityAnalysisPackage S)
    (Ev : StabilityAnalysisEvidence A) : StabilityAnalysisClosed A := by
  exact And.intro Ev.equilibriumExistenceClosed
    (And.intro Ev.stabilityConditionClosed
      (And.intro Ev.attractionBasinClosed Ev.lyapunovFunctionalClosed))

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse