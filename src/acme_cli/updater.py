from __future__ import annotations

import os
import shutil
import subprocess
from threading import Thread

PACKAGE_NAME = "acme-cli"


def _upgrade_with_uv() -> None:  # pragma: no cover
    uv_bin = shutil.which("uv")
    if not uv_bin:
        return

    subprocess.run(
        [uv_bin, "tool", "upgrade", PACKAGE_NAME],
        check=False,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )


def maybe_auto_update() -> None:
    """Kick off a non-blocking background update attempt on every run."""
    if os.getenv("ACME_DISABLE_AUTO_UPDATE") == "1":
        return

    Thread(target=_upgrade_with_uv, daemon=True).start()
