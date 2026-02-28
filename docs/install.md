# Installation options (Claude Code style)

Offer these three install paths:

## 1) Native Install (Recommended)

### macOS / Linux / WSL

```bash
curl -fsSL https://raw.githubusercontent.com/franzsaggl-spec/python-cli-template/main/scripts/install.sh | bash
```

### Windows PowerShell

```powershell
irm https://raw.githubusercontent.com/franzsaggl-spec/python-cli-template/main/scripts/install.ps1 | iex
```

### Windows CMD

```cmd
curl -fsSL https://raw.githubusercontent.com/franzsaggl-spec/python-cli-template/main/scripts/install.cmd -o install.cmd && install.cmd && del install.cmd
```

**Behavior:** native installs auto-update in the background on CLI usage.

---

## 2) Homebrew

```bash
brew install --cask acme-cli
```

**Behavior:** no auto-update by package manager; users run:

```bash
brew upgrade acme-cli
```

---

## 3) WinGet

```powershell
winget install franzsaggl-spec.AcmeCli
```

**Behavior:** no auto-update by package manager; users run:

```powershell
winget upgrade franzsaggl-spec.AcmeCli
```

---

## Notes

- Native installer scripts in this template:
  - `scripts/install.sh`
  - `scripts/install.ps1`
  - `scripts/install.cmd`
- Homebrew formula placeholder:
  - `packaging/homebrew/acme-cli.rb`
- Winget manifest placeholder:
  - `packaging/winget/acme-cli.yaml`
