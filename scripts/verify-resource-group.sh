#!/usr/bin/env bash
set -euo pipefail

GROUP=rg-azure-01-lab

command -v az >/dev/null || { echo "Azure CLI no encontrada" >&2; exit 1; }

echo "Suscripción activa:"
az account show --query "{Subscription:name,State:state,Default:isDefault}" --output table

echo "¿Existe el grupo?"
az group exists --name "$GROUP"

if [[ "$(az group exists --name "$GROUP" -o tsv)" == "true" ]]; then
  echo "Información:"
  az group show --name "$GROUP" --query "{Name:name,Location:location,State:properties.provisioningState,Tags:tags}" -o json
  echo "Recursos existentes (la tabla estará vacía si no hay ninguno):"
  az resource list --resource-group "$GROUP" --output table
fi
