# RFC3161 verification

The token is a FreeTSA RFC3161 timestamp over the SHA-256 of the exact `RELEASE-MANIFEST.sha256` bytes. Only the digest/query was submitted, not the manuscript. The reply signature and query/data message imprints were independently checked with OpenSSL. The certificate chain is trusted specifically against the included FreeTSA self-issued root downloaded over HTTPS; this is an explicit service trust assumption, not a claim of universal/legal notarization.

The token demonstrates that the authority processed this commitment at the recorded time. It does not establish authorship, correctness, novelty, acceptance, or the exact first public availability. No author-identifying detached signature/key is published; the verified CMS signature is the timestamp authority's signature.

The payload manifest intentionally excludes itself and all timestamp files to avoid a circular hash. Check payload hashes first with `python verify_manifest.py`, then:

```sh
openssl ts -verify -in timestamp/manifest.tsr -queryfile timestamp/manifest.tsq -CAfile timestamp/freetsa-root.pem -untrusted timestamp/freetsa-tsa.crt
openssl ts -verify -in timestamp/manifest.tsr -data RELEASE-MANIFEST.sha256 -CAfile timestamp/freetsa-root.pem -untrusted timestamp/freetsa-tsa.crt
openssl ts -reply -in timestamp/manifest.tsr -text
```

Manifest SHA-256: `8367607c4b6a4ba69ac30e4b20337baa1ff7d3115b6c925f1769a3124f49b28c`.

Certificate fingerprints and validity:

```text
freetsa-root.pem
sha256 Fingerprint=A6:37:9E:7C:EC:C0:5F:AA:3C:BF:07:60:13:D7:45:E3:27:BB:BA:A3:8C:0B:9A:F2:24:69:D4:70:1D:18:AA:BC
notBefore=Mar 13 01:52:13 2016 GMT
notAfter=Mar  7 01:52:13 2041 GMT
freetsa-tsa.crt
sha256 Fingerprint=32:E8:41:A9:5C:C1:16:41:01:FF:DE:41:29:8E:F2:FC:75:C1:C4:37:2E:F0:95:E8:8A:6B:BD:47:DF:B1:91:FC
notBefore=Feb 15 19:44:22 2026 GMT
notAfter=Feb  2 19:44:22 2040 GMT
```

Authority reply:

```text
Status info:
Status: Granted.
Status description: unspecified
Failure info: unspecified

TST info:
Version: 1
Policy OID: tsa_policy1
Hash Algorithm: sha256
Message data:
    0000 - 83 67 60 7c 4b 6a 4b a6-9a c3 0e 4b 20 33 7b aa   .g`|KjK....K 3{.
    0010 - 1f f7 d3 11 5b 6c 92 5f-17 69 a3 12 4f 49 b2 8c   ....[l._.i..OI..
Serial number: 0x090EEE88
Time stamp: Oct  9 00:44:35 2026 GMT
Accuracy: unspecified
Ordering: yes
Nonce: 0x43A8C87B82BD8076
TSA: DirName:/O=Free TSA/OU=TSA/description=This certificate digitally signs documents and time stamp requests made using the freetsa.org online services/CN=www.freetsa.org/emailAddress=busilezas@mailbox.org/L=Wuerzburg/C=DE/ST=Bayern
Extensions:
Using configuration from /usr/ssl/openssl.cnf
```
