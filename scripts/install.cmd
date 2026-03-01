@echo off
setlocal

set "PKG=acme-cli"
set "PINNED=%ACME_INSTALL_VERSION%"

where uv >nul 2>nul
if %errorlevel% neq 0 (
  echo [acme installer] uv not found. Installing uv...
  powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://astral.sh/uv/install.ps1 | iex"
  set "PATH=%USERPROFILE%\.local\bin;%PATH%"
)

where uv >nul 2>nul
if %errorlevel% neq 0 (
  echo [acme installer] ERROR: uv is still not available in PATH after install
  exit /b 1
)

if not "%PINNED%"=="" (
  echo [acme installer] Installing pinned version: %PKG%==%PINNED%
  uv tool install "%PKG%==%PINNED%" --force
) else (
  echo [acme installer] Installing/upgrading latest: %PKG%
  uv tool install %PKG% --upgrade
)

if %errorlevel% neq 0 (
  echo [acme installer] ERROR: failed to install package
  exit /b 1
)

echo [acme installer] Success. Run: acme --help
