# Native-style installer for Windows PowerShell.
# Installs uv automatically (if missing), then installs/updates the CLI tool.

$uv = Get-Command uv -ErrorAction SilentlyContinue
if (-not $uv) {
  irm https://astral.sh/uv/install.ps1 | iex
  $env:Path = "$env:USERPROFILE\.local\bin;$env:Path"
}

uv tool install acme-cli --upgrade | Out-Null
Write-Host "acme installed. Run: acme --help"
