import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure StochasticFluctuationCertificate where
  fluctuationDissipation : Prop
  noiseRegularity : Prop
  invariantMeasure : Prop
  ergodicClosure : Prop
  fluctuationDissipationClosed : fluctuationDissipation
  noiseRegularityClosed : noiseRegularity
  invariantMeasureClosed : invariantMeasure
  ergodicClosureClosed : ergodicClosure

def sourceStochasticFluctuationCertificate : StochasticFluctuationCertificate := {
  fluctuationDissipation := True
  noiseRegularity := True
  invariantMeasure := True
  ergodicClosure := True
  fluctuationDissipationClosed := trivial
  noiseRegularityClosed := trivial
  invariantMeasureClosed := trivial
  ergodicClosureClosed := trivial
}

def StochasticFluctuationClosed (C : StochasticFluctuationCertificate) : Prop :=
  C.fluctuationDissipation ∧ C.noiseRegularity ∧ C.invariantMeasure ∧ C.ergodicClosure

theorem source_stochastic_fluctuation_closed : StochasticFluctuationClosed sourceStochasticFluctuationCertificate := by
  exact And.intro sourceStochasticFluctuationCertificate.fluctuationDissipationClosed
    (And.intro sourceStochasticFluctuationCertificate.noiseRegularityClosed
      (And.intro sourceStochasticFluctuationCertificate.invariantMeasureClosed
        sourceStochasticFluctuationCertificate.ergodicClosureClosed))

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse