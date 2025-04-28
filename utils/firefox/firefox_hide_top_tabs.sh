#!/bin/bash

# Find the Firefox profile directory (assumes default-release profile)
profile_dir=$(find ~/.mozilla/firefox -maxdepth 1 -type d -name "*.default-release" | head -n 1)

if [ -z "$profile_dir" ]; then
  echo "Firefox profile directory not found."
  exit 1
fi

# Create chrome directory if it doesn't exist
mkdir -p "$profile_dir/chrome"

# Write CSS to hide the tab bar
cat > "$profile_dir/chrome/userChrome.css" << EOF
#TabsToolbar {
  visibility: collapse !important;
}
EOF

echo "userChrome.css updated to hide Firefox's top tab bar."
echo "IMPORTANT: In Firefox, go to about:config and set 'toolkit.legacyUserProfileCustomizations.stylesheets' to true, then restart Firefox."
