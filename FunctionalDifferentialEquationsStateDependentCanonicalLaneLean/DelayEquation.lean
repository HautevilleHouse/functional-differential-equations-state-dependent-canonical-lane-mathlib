import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.StateSpace

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure DelayEquation (S : StateSpace X) where
  historyFunctional : Type u
  delayFunction : Type v
  equationForm : Prop
  stateDependentDelay : Prop
  wellPosedness : Prop

structure DelayEquationEvidence {S : StateSpace X} (D : DelayEquation S) where
  equationFormClosed : D.equationForm
  stateDependentDelayClosed : D.stateDependentDelay
  wellPosednessClosed : D.wellPosedness

def DelayEquationClosed {S : StateSpace X} (D : DelayEquation S) : Prop :=
  D.equationForm ∧ D.stateDependentDelay ∧ D.wellPosedness

theorem delay_equation_closed_from_evidence {S : StateSpace X} (D : DelayEquation S)
    (E : DelayEquationEvidence D) : DelayEquationClosed D := by
  exact And.intro E.equationFormClosed
    (And.intro E.stateDependentDelayClosed E.wellPosednessClosed)

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse
