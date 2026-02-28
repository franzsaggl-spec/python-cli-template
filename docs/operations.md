# Operations

## Environment variables

Required keys must be read from env only.

### Linux/macOS

```bash
# ~/.bashrc or ~/.zshrc
export ACME_API_TOKEN="your-token"
```

### Windows (PowerShell)

```powershell
[Environment]::SetEnvironmentVariable("ACME_API_TOKEN", "your-token", "User")
```

## Installation

### Linux/macOS (native-style)

```bash
curl -fsSL https://raw.githubusercontent.com/franzsaggl-spec/python-cli-template/main/scripts/install.sh | bash
```

### Windows PowerShell (native-style)

```powershell
irm https://raw.githubusercontent.com/franzsaggl-spec/python-cli-template/main/scripts/install.ps1 | iex
```

Template installers live in:

- `scripts/install.sh`
- `scripts/install.ps1`

## Auto-update

The CLI triggers a non-blocking update attempt on each invocation.

Disable when needed:

```bash
export ACME_DISABLE_AUTO_UPDATE=1
```

## Build

```bash
uv build
```
