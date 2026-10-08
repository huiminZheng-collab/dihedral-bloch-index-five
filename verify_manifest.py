"""Verify payload hashes and reject unexpected release files."""
from pathlib import Path, PurePosixPath
import hashlib, sys
root=Path(__file__).resolve().parent
expected={}
try:
    for line in (root/'RELEASE-MANIFEST.sha256').read_text(encoding='ascii').splitlines():
        digest,name=line.split('  ',1)
        p=PurePosixPath(name)
        if len(digest)!=64 or any(c not in '0123456789abcdef' for c in digest) or p.is_absolute() or '..' in p.parts or name in expected:
            raise ValueError('invalid manifest')
        expected[name]=digest
    allowed=set(expected)|{'RELEASE-MANIFEST.sha256','timestamp/manifest.tsq','timestamp/manifest.tsr','timestamp/freetsa-root.pem','timestamp/freetsa-tsa.crt','timestamp/VERIFICATION.md'}
    actual={p.relative_to(root).as_posix() for p in root.rglob('*') if p.is_file() and '.git' not in p.relative_to(root).parts and '__pycache__' not in p.relative_to(root).parts}
    if actual-allowed: raise ValueError('unexpected files: '+repr(sorted(actual-allowed)))
    for name,digest in expected.items():
        if hashlib.sha256((root/name).read_bytes()).hexdigest()!=digest: raise ValueError('modified file: '+name)
    print('PAYLOAD_MANIFEST_OK',len(expected))
except (OSError,ValueError) as exc:
    print('VERIFICATION_FAILED',exc,file=sys.stderr)
    sys.exit(1)
