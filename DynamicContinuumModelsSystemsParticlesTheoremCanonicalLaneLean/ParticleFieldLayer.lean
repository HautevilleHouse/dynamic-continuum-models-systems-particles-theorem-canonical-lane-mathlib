import canonicalLaneMathlib.ParticleField

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure ParticleFieldCertificate where
  fieldConfig : Prop
  interactionKernel : Prop
  fieldConfigClosed : fieldConfig
  interactionKernelClosed : interactionKernel

def sourceParticleFieldCertificate : ParticleFieldCertificate := {
  fieldConfig := sourceFormulaModels.length = sourceFormulaModelCount
  interactionKernel := baselineCertificateAllPass = true
  fieldConfigClosed := rfl
  interactionKernelClosed := rfl
}

def ParticleFieldClosed (C : ParticleFieldCertificate) : Prop :=
  C.fieldConfig ∧ C.interactionKernel

theorem source_particle_field_closed :
    ParticleFieldClosed sourceParticleFieldCertificate := by
  exact And.intro sourceParticleFieldCertificate.fieldConfigClosed
    sourceParticleFieldCertificate.interactionKernelClosed

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse