import DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean.KineticFluidLayer

/-!
# Continuum-Particle Formalization

This module gives the theorem package a local vocabulary for continuum-particle systems:
phase space, interaction kernels, and closure conditions.
-/

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

abbrev PhaseSpace := Fin 6 → ℝ
structure InteractionKernel where
  repulsive : Fin 3 → ℝ
  attractive : Fin 3 → ℝ

def zeroInteractionKernel : InteractionKernel := {
  repulsive := fun _ => 0
  attractive := fun _ => 0
}

structure ContinuumParticleSystem where
  density : PhaseSpace → ℝ
  kernel : InteractionKernel
  closureCondition : Prop

def primitiveSystem : ContinuumParticleSystem := {
  density := fun _ => 1
  kernel := zeroInteractionKernel
  closureCondition := True
}

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse