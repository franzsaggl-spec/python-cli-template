# Release integrity (recommended)

For native installers, publish release artifacts with checksums.

## Minimum

- Generate SHA256 for each release artifact
- Publish `checksums.txt` alongside binaries
- Use tag-driven artifact release workflow (`.github/workflows/release-artifacts.yml`)

## Better

- Sign checksums with GPG or Sigstore
- Document verification commands in release notes

## Example verify (Linux/macOS)

```bash
sha256sum -c checksums.txt
```

## Why

One-liner installers are convenient, but integrity verification is what makes them enterprise-safe.
