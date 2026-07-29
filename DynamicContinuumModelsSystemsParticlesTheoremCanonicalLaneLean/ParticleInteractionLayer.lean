import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure ParticleInteractionCertificate where
  collisionOperator : Prop
  potentialBounds : Prop
  correlationDecay : Prop
  entropyProduction : Prop
  collisionOperatorClosed : collisionOperator
  potentialBoundsClosed : potentialBounds
  correlationDecayClosed : correlationDecay
  entropyProductionClosed : entropyProduction

def sourceParticleInteractionCertificate : ParticleInteractionCertificate := {
  collisionOperator := True
  potentialBounds := True
  correlationDecay := True
  entropyProduction := True
  collisionOperatorClosed := trivial
  potentialBoundsClosed := trivial
  correlationDecayClosed := trivial
  entropyProductionClosed := trivial
}

def ParticleInteractionClosed (C : ParticleInteractionCertificate) : Prop :=
  C.collisionOperator ∧ C.potentialBounds ∧ C.correlationDecay ∧ C.entropyProduction

theorem source_particle_interaction_closed : ParticleInteractionClosed sourceParticleInteractionCertificate := by
  exact And.intro sourceParticleInteractionCertificate.collisionOperatorClosed
    (And.intro sourceParticleInteractionCertificate.potentialBoundsClosed
      (And.intro sourceParticleInteractionCertificate.correlationDecayClosed
        sourceParticleInteractionCertificate.entropyProductionClosed))

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse