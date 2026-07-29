import FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure AdmissibleClass where
  object : FunctionalDifferentialEquationsStateDependentAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FunctionalDifferentialEquationsStateDependentWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse