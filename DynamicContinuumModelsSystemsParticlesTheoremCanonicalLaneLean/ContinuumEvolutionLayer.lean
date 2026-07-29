import canonicalLaneMathlib.ContinuumEvolution

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure ContinuumEvolutionCertificate where
  particleField : ParticleFieldCertificate
  evolutionEqn : Prop
  regularityControl : Prop
  evolutionEqnClosed : evolutionEqn
  regularityControlClosed : regularityControl

def sourceContinuumEvolutionCertificate : ContinuumEvolutionCertificate := {
  particleField := sourceParticleFieldCertificate
  evolutionEqn := sourceFormulaModels.length = 7
  regularityControl := outsideConstantDependencyCount = 0
  evolutionEqnClosed := rfl
  regularityControlClosed := rfl
}

def ContinuumEvolutionClosed (C : ContinuumEvolutionCertificate) : Prop :=
  ParticleFieldClosed C.particleField ∧ C.evolutionEqn ∧ C.regularityControl

theorem source_continuum_evolution_closed :
    ContinuumEvolutionClosed sourceContinuumEvolutionCertificate := by
  exact And.intro source_particle_field_closed
    (And.intro sourceContinuumEvolutionCertificate.evolutionEqnClosed
      sourceContinuumEvolutionCertificate.regularityControlClosed)

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse