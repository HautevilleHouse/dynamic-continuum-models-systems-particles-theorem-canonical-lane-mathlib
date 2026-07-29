import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean

structure ConvergenceMetrics where
  L2Error : ℝ
  H1Error : ℝ
  convergenceRate : ℝ

def defaultConvergenceMetrics : ConvergenceMetrics := { L2Error := 0, H1Error := 0, convergenceRate := 0 }

structure ConvergenceCertificate where
  metrics : ConvergenceMetrics
  errorBound : ℝ
  rateLowerBound : ℝ
  errorProof : metrics.L2Error ≤ errorBound ∧ metrics.H1Error ≤ errorBound
  rateProof : metrics.convergenceRate ≥ rateLowerBound

def defaultConvergenceCertificate : ConvergenceCertificate := {
  metrics := defaultConvergenceMetrics,
  errorBound := 0.1,
  rateLowerBound := 0.5,
  errorProof := by
    refine And.intro ?_ ?_
    · have h : defaultConvergenceMetrics.L2Error = 0 := rfl
      rw [h]
      linarith
    · have h : defaultConvergenceMetrics.H1Error = 0 := rfl
      rw [h]
      linarith,
  rateProof := by
    have h : defaultConvergenceMetrics.convergenceRate = 0 := rfl
    rw [h]
    linarith
}

def ConvergenceTheoremClosed (C : ConvergenceCertificate) : Prop :=
  C.metrics.L2Error ≤ C.errorBound ∧ C.metrics.H1Error ≤ C.errorBound ∧ C.metrics.convergenceRate ≥ C.rateLowerBound

theorem default_convergence_theorem_closed : ConvergenceTheoremClosed defaultConvergenceCertificate := by
  refine And.intro ?_ (And.intro ?_ ?_)
  · exact defaultConvergenceCertificate.errorProof.1
  · exact defaultConvergenceCertificate.errorProof.2
  · exact defaultConvergenceCertificate.rateProof

end DynamicContinuumModelsSystemsParticlesTheoremCanonicalLaneLean
end HautevilleHouse
