#!/usr/bin/env bash

# ref: https://developer.mozilla.org/en-US/Firefox/Enterprise_deployment

set -eux

cat << EOF > /usr/lib/firefox-esr/defaults/pref/local-settings.js
// Local configuration
pref("general.config.filename", "mozilla.cfg");
pref("general.config.obscure_value", 0);
EOF

cat << EOF > /usr/lib/firefox-esr/mozilla.cfg
// Set MateriApps as homepage
defaultPref("browser.startup.homepage", "data:text/plain,browser.startup.homepage=http://ma.cms-initiative.jp/");
pref("startup.homepage_welcome_url", "")
pref("startup.homepage_welcome_url.additional", "")

// Don't show WhatsNew on first run after every update
pref("browser.startup.homepage_override.mstone","ignore");
EOF
