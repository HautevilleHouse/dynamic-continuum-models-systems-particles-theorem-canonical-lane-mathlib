import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure ParticlePosition where
  coordinate : ℝ × ℝ × ℝ
  time : ℝ

structure ParticleMomentum where
  momentum : ℝ × ℝ × ℝ

def particleState (pos : ParticlePosition) (mom : ParticleMomentum) : ℝ × ℝ × ℝ × ℝ × ℝ × ℝ := 
  (pos.coordinate.1, pos.coordinate.2.1, pos.coordinate.2.2, mom.momentum.1, mom.momentum.2.1, mom.momentum.2.2)

structure ContinuumField where
  density : ℝ → ℝ → ℝ → ℝ
  velocity : ℝ → ℝ → ℝ → ℝ × ℝ × ℝ

structure ParticleContinuumSystem where
  particleCount : ℕ
  particles : Fin particleCount → ParticlePosition × ParticleMomentum
  field : ContinuumField
  coupling : ℝ

def defaultParticlePosition : ParticlePosition := { coordinate := (0,0,0), time := 0 }
def defaultParticleMomentum : ParticleMomentum := { momentum := (0,0,0) }
def defaultContinuumField : ContinuumField := { density := λ _ _ _ => 0, velocity := λ _ _ _ => (0,0,0) }
def defaultParticleContinuumSystem : ParticleContinuumSystem := { particleCount := 0, particles := Fin.elim0, field := defaultContinuumField, coupling := 0 }

structure ForceLaw where
  particleForce : ParticleContinuumSystem → Fin (particleCount) → ℝ × ℝ × ℝ
  fieldForce : ParticleContinuumSystem → (ℝ × ℝ × ℝ) → ℝ × ℝ × ℝ

def defaultForceLaw : ForceLaw := { particleForce := λ _ _ => (0,0,0), fieldForce := λ _ _ => (0,0,0) }

structure DynamicEvolution where
  system : ParticleContinuumSystem
  forceLaw : ForceLaw
  timeStep : ℝ
  totalTime : ℝ

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse
