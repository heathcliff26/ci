# Verify release artifacts

All release artifacts created by workflows in this repository are signed by cosign and can be verified by the [public key](cosign.pub):
```
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEbomhZzFaYvsbMNuW93g4kUhxlmmm
buRXdYMkPVkDOjFTrBT99Rsb6tzY69mYB3H7OdxqLDG2AH2qYu681slLeg==
-----END PUBLIC KEY-----
```
Please save this key on your end and keep it on hand for verifying the artifacts. Should it change, be highly suspicious.

# Verify container images and helm charts

Here is an example to verify a container image:
```bash
cosign verify --key https://files.heathcliff.eu/cosign.pub ghcr.io/heathcliff26/fleetlock:latest
```

# Verify release artifacts

All release artifacts have an additional file ending with `.sigstore.json`. You can verify the like this:
```bash
cosign verify-blob --key https://files.heathcliff.eu/cosign.pub \
    https://github.com/heathcliff26/fleetlock/releases/latest/download/fleetctl-amd64 \
    --bundle https://github.com/heathcliff26/fleetlock/releases/latest/download/fleetctl-amd64.sigstore.json
```
