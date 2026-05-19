#!/usr/bin/env bash
set -euo pipefail

echo "==> Java (OpenJDK via Homebrew)"

if ! command -v java &>/dev/null; then
  echo "  Installing OpenJDK..."
  brew install openjdk

  # Make the JDK visible to system Java wrappers
  JDK_LINK="/Library/Java/JavaVirtualMachines/openjdk.jdk"
  BREW_JDK="$(brew --prefix openjdk)/libexec/openjdk.jdk"
  if [ ! -e "$JDK_LINK" ]; then
    sudo ln -sfn "$BREW_JDK" "$JDK_LINK"
    echo "  Symlinked OpenJDK into /Library/Java/JavaVirtualMachines/"
  fi
else
  echo "  Java already installed: $(java -version 2>&1 | head -1)"
fi
