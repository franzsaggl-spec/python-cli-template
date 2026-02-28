@echo off
setlocal

where uv >nul 2>nul
if %errorlevel% neq 0 (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://astral.sh/uv/install.ps1 | iex"
  set "PATH=%USERPROFILE%\.local\bin;%PATH%"
)

uv tool install acme-cli --upgrade >nul 2>nul
if %errorlevel% neq 0 (
  echo install failed
  exit /b 1
)

echo acme installed. Run: acme --help
