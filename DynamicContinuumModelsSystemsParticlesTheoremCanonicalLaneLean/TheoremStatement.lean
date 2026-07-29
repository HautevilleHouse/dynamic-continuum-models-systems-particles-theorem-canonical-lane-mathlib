import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  continuumStatement : String
  particleStatement : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := sourceTheoremBoundary.claimBoundary,
  continuumStatement := "dynamic continuum model with systems particles",
  particleStatement := "systems particles constraint",
  carriedRemainder := "classical source boundary carried by formalizationCertificate.theoremBoundaryOpen and sourceTheoremBoundary"
}

def ClassicalSourceBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  formalizationCertificate.sourceConjectureClosureClaimed = false

def TheoremLayerInternalized : Prop :=
  sourceTheoremStatement.sourceKey = sourceRepository ∧
  ClassicalSourceBoundaryCarried

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = sourceRepository := by
  rfl

theorem classical_source_boundary_carried_checked :
    ClassicalSourceBoundaryCarried := by
  exact And.intro rfl rfl

theorem theorem_layer_internalized_checked :
    TheoremLayerInternalized := by
  exact And.intro theorem_statement_source_key_checked classical_source_boundary_carried_checked

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse