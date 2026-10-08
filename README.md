# A positive-density family of dihedral fields with Bloch lattice index five

Content-anonymous research preprint, version 1. This is a public preprint release, not a journal submission or acceptance. The hosting account can be associated with a person; no unlinkable-account anonymity is claimed.

The theorem keeps the quadratic subfield Q(i) fixed. A Chebotarev set of parameter primes has density 1/50; for each such prime at least two of four mixed quintic rays of conductor (25 ell) have Q2=5 and five-primary tame kernel (Z/5)^2. The manuscript supplies the integral proof. The density concerns parameter primes, not fields ordered by discriminant.

## Files and checks

- `paper-anonymous.pdf` and `paper.tex`: manuscript and editable source.
- `anc/check_tate_data.gp`: certified fixed cyclotomic Tate data and seven prime controls.
- `anc/check_wild_seed.gp`: certified conductor-25 dihedral seed.
- The `.log.txt` files record successful PARI/GP 2.15.5 executions. These scripts verify fixed arithmetic data, not the whole theorem.
- `verify_manifest.py`: detects missing, modified or unexpected files.
- `RELEASE-MANIFEST.sha256`: SHA-256 commitment to the payload.
- `timestamp/`: RFC3161 query, reply, certificates and verification instructions.

Run `python verify_manifest.py` from this directory. With PARI/GP 2.15.5, run `gp -q -f check_tate_data.gp` and `gp -q -f check_wild_seed.gp` inside `anc/`; the final markers must be `TATE_DATA_DONE` and `WILD_SEED_DONE`. GP error output must also be inspected. Compile `paper.tex` with pdfLaTeX three times. The supplied PDF was built twice independently with identical bytes using TeX Live 2024.

## Scope of novelty assessment

Closest primary sources checked include Browkin--Gangl, Guo--Qin, Assim--Movahhedi, Lam--Liu--Sharifi--Wake--Wang, Caputo and Bartel--de Smit. Existing general tools and numerical precedents are explicitly attributed. The proposed contribution is the fixed-base positive-density mixed family and its integral group structure. No equivalent result was located in the checked sources; this is not an exhaustive priority guarantee. The manuscript is offered for external scrutiny. Language-model assistance is disclosed in the manuscript; no Lean verification is claimed.

The timestamp commits to the manifest hash; it does not certify correctness, authorship or originality. GitHub commit dates alone are not trusted timestamp evidence. See `timestamp/VERIFICATION.md` for the separately verifiable token and its explicit trust assumptions.
