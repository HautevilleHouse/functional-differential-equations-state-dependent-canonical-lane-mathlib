import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FunctionalDifferentialEquationsStateDependentCanonicalLaneLean.SolutionExistencePackage

namespace HautevilleHouse
namespace FunctionalDifferentialEquationsStateDependentCanonicalLaneLean

structure BifurcationStructurePackage {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E} where
  parameterSpace : Type u
  parameterTopology : TopologicalSpace parameterSpace
  bifurcationPoints : Prop
  genericUnfolding : Prop
  normalForm : Prop

structure BifurcationStructureEvidence {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E}
    (B : BifurcationStructurePackage S) where
  bifurcationPointsClosed : B.bifurcationPoints
  genericUnfoldingClosed : B.genericUnfolding
  normalFormClosed : B.normalForm

def BifurcationStructureClosed {P : StateDependentDelayEquationPackage}
    {E : StateDependentDelayEquationEvidence P} {S : SolutionExistencePackage E}
    (B : BifurcationStructurePackage S) : Prop :=
  B.bifurcationPoints ∧ B.genericUnfolding ∧ B.normalForm

theorem bifurcation_structure_closed_from_evidence
    {P : StateDependentDelayEquationPackage} {E : StateDependentDelayEquationEvidence P}
    {S : SolutionExistencePackage E} (B : BifurcationStructurePackage S)
    (Ev : BifurcationStructureEvidence B) : BifurcationStructureClosed B := by
  exact And.intro Ev.bifurcationPointsClosed
    (And.intro Ev.genericUnfoldingClosed Ev.normalFormClosed)

end FunctionalDifferentialEquationsStateDependentCanonicalLaneLean
end HautevilleHouse