import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.StateDependentDelayEquation
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.SolutionExistencePackage
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.StabilityAnalysis
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.BifurcationStructure
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.PeriodicSolutions

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedFunctionalDifferentialEquationsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_functional_differential_equations_endgame (A : AdmissibleClass) :
    ConstrainedFunctionalDifferentialEquationsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse