# Native-style installer for Windows PowerShell.
# Installs uv automatically (if missing), then installs/upgrades the CLI tool.
# Optional pin: $env:ACME_INSTALL_VERSION = "0.1.0"

$ErrorActionPreference = "Stop"
$pkg = "acme-cli"
$version = $env:ACME_INSTALL_VERSION

function Fail($msg) {
  Write-Error "[acme installer] $msg"
  exit 1
}

$uv = Get-Command uv -ErrorAction SilentlyContinue
if (-not $uv) {
  Write-Host "[acme installer] uv not found. Installing uv..."
  irm https://astral.sh/uv/install.ps1 | iex
  $env:Path = "$env:USERPROFILE\.local\bin;$env:Path"
}

$uv = Get-Command uv -ErrorAction SilentlyContinue
if (-not $uv) { Fail "uv is still not available in PATH after install" }

if ($version) {
  Write-Host "[acme installer] Installing pinned version: $pkg==$version"
  uv tool install "$pkg==$version" --force | Out-Null
} else {
  Write-Host "[acme installer] Installing/upgrading latest: $pkg"
  uv tool install $pkg --upgrade | Out-Null
}

if ($LASTEXITCODE -ne 0) { Fail "failed to install package" }
Write-Host "[acme installer] Success. Run: acme --help"
