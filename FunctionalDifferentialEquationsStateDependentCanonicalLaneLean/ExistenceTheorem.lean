import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure ExistenceConditions where
  lipschitzCondition : Prop
  boundedDelay : Prop
  initialData : Prop

def ExistenceClosed (E : ExistenceConditions) : Prop :=
  E.lipschitzCondition ∧ E.boundedDelay ∧ E.initialData

theorem existence_closed_from_conditions (E : ExistenceConditions) (h : ExistenceClosed E) : ExistenceClosed E := h

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse
