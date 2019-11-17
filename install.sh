#!/bin/sh

set -e

_gh_repo="libreoffice-dark-icons-svg"
_gh_desc="Breeze-Dark/Sifr-Dark SVG icon themes"

cat <<- EOF

  $_gh_desc
  https://github.com/primuladimaggio/$_gh_repo
  
  
EOF

_sifr="images_sifrdark_svg.zip"
_breeze="images_breezedark_svg.zip"

echo "=> Deleting old ..."
sudo rm -f "/usr/share/libreoffice/share/config/$_sifr"
sudo rm -f "/usr/share/libreoffice/share/config/$_breeze"

echo "=> Installing ..."
sudo mkdir -p "/usr/share/libreoffice/share/config"

sudo cp "$_sifr" "/usr/share/libreoffice/share/config"
sudo cp "$_breeze" "/usr/share/libreoffice/share/config"

for dir in \
  /usr/lib64/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo ln -sf "/usr/share/libreoffice/share/config/$_sifr" "$dir"
  sudo ln -sf "/usr/share/libreoffice/share/config/$_breeze" "$dir"
done

echo "=> Done!"
