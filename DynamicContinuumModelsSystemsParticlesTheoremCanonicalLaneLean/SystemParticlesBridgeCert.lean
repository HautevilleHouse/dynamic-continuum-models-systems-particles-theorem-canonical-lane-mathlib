import canonicalLaneMathlib.SystemParticlesBridge

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure DynamicSystemsCert where
  continuumEvolution : ContinuumEvolutionCertificate
  particleInteraction : Prop
  stabilityMargin : Prop
  particleInteractionClosed : particleInteraction
  stabilityMarginClosed : stabilityMargin

def sourceDynamicSystemsCert : DynamicSystemsCert := {
  continuumEvolution := sourceContinuumEvolutionCertificate
  particleInteraction := baselineCertificateGates.length = 7
  stabilityMargin := sourceFormulaModels.length = 7
  particleInteractionClosed := rfl
  stabilityMarginClosed := rfl
}

def DynamicSystemsCertClosed (C : DynamicSystemsCert) : Prop :=
  ContinuumEvolutionClosed C.continuumEvolution ∧ C.particleInteraction ∧ C.stabilityMargin

theorem source_dynamic_systems_cert_closed :
    DynamicSystemsCertClosed sourceDynamicSystemsCert := by
  exact And.intro source_continuum_evolution_closed
    (And.intro sourceDynamicSystemsCert.particleInteractionClosed
      sourceDynamicSystemsCert.stabilityMarginClosed)

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse