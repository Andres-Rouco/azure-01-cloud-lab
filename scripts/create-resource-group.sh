#!/usr/bin/env bash
set -euo pipefail

GROUP=rg-azure-01-lab
LOCATION=westeurope

command -v az >/dev/null || { echo "Azure CLI no encontrada" >&2; exit 1; }

SUB_NAME=$(az account show --query name -o tsv)
SUB_STATE=$(az account show --query state -o tsv)
if [[ "$SUB_NAME" != "Azure for Students" || "$SUB_STATE" != "Enabled" ]]; then
  echo "No está activa una suscripción Azure for Students habilitada; cancelando." >&2
  exit 1
fi

echo "Se creará el grupo '$GROUP' en '$LOCATION' dentro de '$SUB_NAME'."
read -r -p "¿Continuar? [s/N] " answer
[[ "$answer" == "s" || "$answer" == "S" ]] || { echo "Cancelado."; exit 0; }

az group create \
  --name "$GROUP" \
  --location "$LOCATION" \
  --tags project=azure-01 environment=lab \
  --output table

echo "Revisa el grupo en Azure Portal y ejecuta la comprobación."
