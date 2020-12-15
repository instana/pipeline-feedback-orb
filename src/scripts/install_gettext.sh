#!/bin/bash

set -eo pipefail

function install_gettext()
{
  family=$(uname -s | tr '[:upper:]' '[:lower:]')
  # Detect OS family
  case $family in
    linux)
      osID=$(grep -e "^ID=" /etc/os-release | cut -c4-)
      ;;
    *)
      echo "Unsupported operating system."
      exit 1
      ;;
  esac
  # Install gettext according to OS id
  case $osID in
    ubuntu|debian)
      apt-get update && apt-get install -y --no-install-recommends gettext
      ;;
    alpine)
      apk update && apk add --no-cache gettext
      ;;
    *)
      echo "Please use a debian/ubuntu or an alpine container."
      exit 1
      ;;
  esac
}

install_gettext
