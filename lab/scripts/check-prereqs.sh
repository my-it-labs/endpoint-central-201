#!/usr/bin/env bash
set -euo pipefail

# Host Linux. En Windows usa: .\scripts\check-prereqs.ps1
echo "=== Comprobaciones del host Linux (laboratorio Endpoint Central) ==="

need() { command -v "$1" >/dev/null 2>&1 || { echo "Falta: $1"; exit 1; }; }

need vagrant
need VBoxManage

echo "Vagrant: $(vagrant --version)"
echo "VirtualBox: $(VBoxManage --version)"

if vagrant plugin list 2>/dev/null | grep -q vagrant-vbguest; then
  echo "Plugin vagrant-vbguest: instalado"
else
  echo "Aviso: instala el plugin con: vagrant plugin install vagrant-vbguest"
fi

if [[ -r /proc/meminfo ]]; then
  kb=$(awk '/MemTotal:/ {print $2}' /proc/meminfo)
  gb=$((kb / 1024 / 1024))
  echo "RAM total (aprox): ${gb} GB"
  if (( gb < 12 )); then
    echo "Aviso: con menos de ~12 GB el lab (6+4 GB en VMs + host) puede ir justo."
  fi
fi

df -h "$HOME" | awk 'NR==1 || NR==2 {print}'

if groups | grep -q vboxusers; then
  echo "Usuario en grupo vboxusers: sí"
else
  echo "Aviso: si VirtualBox falla al arrancar VMs, añade tu usuario a vboxusers y vuelve a iniciar sesión."
fi

echo "=== Listo. Siguiente: vagrant up (desde la carpeta lab/) ==="
