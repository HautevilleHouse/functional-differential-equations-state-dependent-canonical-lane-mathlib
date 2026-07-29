import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FuncDiffEqStateDependent

structure StateDependentOperator where
  stateSpace : Type u
  delayFunction : stateSpace → stateSpace → ℝ
  operator : (ℝ → stateSpace) → (ℝ → stateSpace)
  causal : Prop
  locallyLipschitz : Prop
  continuity : Prop
  causalTerm : causal
  locallyLipschitzTerm : locallyLipschitz
  continuityTerm : continuity

structure StateDependentOperatorEvidence (O : StateDependentOperator) where
  causalClosed : O.causal
  locallyLipschitzClosed : O.locallyLipschitz
  continuityClosed : O.continuity

def StateDependentOperatorClosed (O : StateDependentOperator) : Prop :=
  O.causal ∧ O.locallyLipschitz ∧ O.continuity

theorem state_dependent_operator_closed_from_evidence
    (O : StateDependentOperator) (E : StateDependentOperatorEvidence O) :
    StateDependentOperatorClosed O := by
  exact And.intro E.causalClosed (And.intro E.locallyLipschitzClosed E.continuityClosed)

end FuncDiffEqStateDependent
end HautevilleHouse