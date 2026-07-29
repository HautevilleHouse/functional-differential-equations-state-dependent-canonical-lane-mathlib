import FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FunctionalDifferentialEquationsStateDependentWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse