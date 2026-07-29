import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure StateSpace (X : Type) where
  carrier : X
  topology : TopologicalSpace X
  variableDomain : Prop

structure StateSpaceEvidence (S : StateSpace X) where
  variableDomainClosed : S.variableDomain

def StateSpaceClosed (S : StateSpace X) : Prop :=
  S.variableDomain

theorem state_space_closed_from_evidence (S : StateSpace X) (E : StateSpaceEvidence S) :
    StateSpaceClosed S := by
  exact E.variableDomainClosed

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse
