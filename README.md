# A positive-density family of dihedral fields with Bloch lattice index five

Content-anonymous research preprint, manuscript version 1; repository documentation revision 2. This is a public preprint release, not a journal submission or acceptance. The hosting account can be associated with a person; no unlinkable-account anonymity is claimed.

The theorem keeps the quadratic subfield Q(i) fixed. A Chebotarev set of parameter primes has density 1/50; for each such prime at least two of four mixed quintic rays of conductor (25 ell) have Q2=5 and five-primary tame kernel (Z/5)^2. The manuscript supplies the integral proof. The density concerns parameter primes, not fields ordered by discriminant.

## Guo--Qin's article and the attainability problem

The starting point is X. Guo and H. Qin, **The extended Bloch groups of biquadratic and dihedral number fields**, *Journal of Pure and Applied Algebra* **222** (2018), 3968--3981. [Published article and DOI](https://doi.org/10.1016/j.jpaa.2018.02.015).

In Section 4, Guo--Qin define the dihedral Bloch lattice index \(Q_2(F)\) using the lattices coming from the quadratic subfield and two degree-\(p\) subfields. Their Theorem 4.3 gives \(Q_2(F)\mid p\) in its stated setting. For the \(p=5\) fields considered here, this leaves the two possibilities \(Q_2(F)=1\) and \(Q_2(F)=5\).

The **Guo--Qin attainability problem** addressed here is the resulting question: **can the nontrivial value \(Q_2(F)=p\) actually occur, and can one produce an infinite family?** This wording describes the question arising from their result; it is not presented as a numbered conjecture quoted from their article.

This manuscript addresses \(p=5\): it gives a fixed-quadratic-base family over \(\mathbb Q(i)\), with a positive-density set of parameter primes (density \(1/50\)), for which at least two of the four mixed quintic rays have \(Q_2(F)=5\). The claim is a proof in the manuscript, offered for external review; it is not a claim that the problem has already received independent peer-reviewed confirmation.

Earlier numerical precedents must also be credited: J. Browkin and H. Gangl, **Tame kernels and second regulators of number fields and their subfields**, *Journal of K-Theory* **12** (2013), 137--165, Section 12.4, contains numerical candidates for \(Q_2=p\), including \(p=5\) and \(p=7\). [Published article and DOI](https://doi.org/10.1017/is013005031jkt229). The contribution proposed here is the proved fixed-base positive-density family and its integral group structure, rather than the first numerical suggestion of attainability.

中文说明：本项目研究的是郭–秦《The extended Bloch groups of biquadratic and dihedral number fields》第 4 节的二面体 Bloch 格指数。由其指数整除结论引出的核心问题是：非平凡值 Q₂(F)=p 能否实现，能否构造无穷族？本稿针对 p=5，提出二次子域固定为 Q(i)、参数素数集合具有正密度的证明。这里“郭–秦问题”是对该可实现性问题的简称，并非声称原文列有同名编号猜想。

## Documentation revision and preserved release

Documentation revision 2 adds the explicit Guo--Qin reference, the attainability question and the Browkin--Gangl numerical precedent. The manuscript, PDF, arithmetic scripts and recorded arithmetic outputs are byte-for-byte unchanged. The original version-1 release, manifest and timestamp remain available at [the immutable version-1 commit](https://github.com/huiminZheng-collab/dihedral-bloch-index-five/tree/79cff33e968791b238c09d6ed2faad01196c4c8e). The manifest and timestamp in the current tree commit to this documentation revision; they do not replace the original evidence.

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
