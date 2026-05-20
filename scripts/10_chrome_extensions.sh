#!/usr/bin/env bash
set -euo pipefail

echo "==> Chrome extensions"

if ! [ -d "/Applications/Google Chrome.app" ]; then
  echo "  Chrome not found — skipping"
  echo "  Run scripts/06_apps.sh first"
  exit 0
fi

# Chrome extensions must be installed manually via the Web Store.
# This script opens each extension page in Chrome — click "Add to Chrome" for each.

declare -A extensions=(
  ["React Developer Tools"]="https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi"
  ["Redux DevTools"]="https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd"
  ["Wappalyzer"]="https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg"
  ["I don't care about cookies"]="https://chrome.google.com/webstore/detail/i-dont-care-about-cookies/fihnjjcciajhdojfnbdddfaoknhalnja"
  ["JSON Formatter"]="https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa"
["ModHeader"]="https://chrome.google.com/webstore/detail/modheader-modify-http-hea/idgpnmonknjnojddfkpgkljpfnnfcklj"
)

echo "  Opening ${#extensions[@]} extension pages in Chrome..."
echo "  Click 'Add to Chrome' for each one."
echo ""

for name in "${!extensions[@]}"; do
  echo "    - $name"
  open -a "Google Chrome" "${extensions[$name]}"
  sleep 0.5
done
