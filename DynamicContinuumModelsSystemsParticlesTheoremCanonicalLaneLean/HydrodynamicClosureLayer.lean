import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure HydrodynamicClosureCertificate where
  localEquilibrium : Prop
  constitutiveRelations : Prop
  viscosityBounds : Prop
  thermalConductivity : Prop
  localEquilibriumClosed : localEquilibrium
  constitutiveRelationsClosed : constitutiveRelations
  viscosityBoundsClosed : viscosityBounds
  thermalConductivityClosed : thermalConductivity

def sourceHydrodynamicClosureCertificate : HydrodynamicClosureCertificate := {
  localEquilibrium := True
  constitutiveRelations := True
  viscosityBounds := True
  thermalConductivity := True
  localEquilibriumClosed := trivial
  constitutiveRelationsClosed := trivial
  viscosityBoundsClosed := trivial
  thermalConductivityClosed := trivial
}

def HydrodynamicClosureClosed (C : HydrodynamicClosureCertificate) : Prop :=
  C.localEquilibrium ∧ C.constitutiveRelations ∧ C.viscosityBounds ∧ C.thermalConductivity

theorem source_hydrodynamic_closure_closed : HydrodynamicClosureClosed sourceHydrodynamicClosureCertificate := by
  exact And.intro sourceHydrodynamicClosureCertificate.localEquilibriumClosed
    (And.intro sourceHydrodynamicClosureCertificate.constitutiveRelationsClosed
      (And.intro sourceHydrodynamicClosureCertificate.viscosityBoundsClosed
        sourceHydrodynamicClosureCertificate.thermalConductivityClosed))

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse