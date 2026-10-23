# 04 — Crear y comprobar el primer grupo de recursos

**Estado:** Creado y comprobado en Azure mediante salida de Azure CLI compartida por el propietario. Región `westeurope`, aprovisionamiento `Succeeded`, sin recursos desplegados dentro del grupo. La etiqueta se ha corregido mediante `az group update` y se ha verificado su valor utilizando `az group show`.

## Antes de crear

Iniciar sesión y comprobar que la suscripción activa es **Azure for Students**:

```bash
az account show --query "{Subscription:name,State:state,Default:isDefault}" --output table
```

La salida confirmada en la sesión anterior fue: Azure for Students / Enabled / True.

## 1. Crear el grupo

```bash
az group create \
  --name rg-azure-01-lab \
  --location westeurope \
  --tags project=azure-01 environment=lab \
  --output table
```

- `--name`: identificador del contenedor lógico.
- `--location`: región donde se almacenan **los metadatos del grupo**. No fuerza la región de todos los recursos que se añadan después.
- `--tags`: dos etiquetas útiles para organizar y filtrar recursos.
- `--output table`: tabla legible para humanos.

Un grupo de recursos sin recursos de pago no tiene coste propio. **No hemos desplegado VMs, almacenamiento u otros servicios**.

## 2. Comprobar

```bash
az group show \
  --name rg-azure-01-lab \
  --query "{Name:name,Location:location,State:properties.provisioningState,Tags:tags}" \
  --output json
```

```bash
az group exists --name rg-azure-01-lab
```

```bash
az resource list --resource-group rg-azure-01-lab --output table
```

El último comando debería dar una lista vacía si todavía no se ha desplegado ningún servicio. Confirmar visualmente en https://portal.azure.com > Grupos de recursos.

## 3. Incidencia real: etiqueta con error tipográfico

Al crear el grupo se utilizó `enviroment=lab` (falta la `n`). Azure lo admitió porque los nombres de etiquetas son libres. Para sustituir **el conjunto completo** de etiquetas por los dos valores previstos:

```bash
az group update \
  --name rg-azure-01-lab \
  --tags project=azure-01 environment=lab \
  --output table
```

**Importante:** esta instrucción establece el conjunto de etiquetas; no usarla de forma irreflexiva si aparecen etiquetas adicionales que se necesiten conservar. En esta práctica solo se observaron las dos etiquetas iniciales.

Verificar:

```bash
az group show --name rg-azure-01-lab --query tags --output json
```

**Incidencia resuelta:** se confirmó `environment=lab` y `project=azure-01` antes de eliminar el grupo.

## 4. Limpieza — realizada y verificada

Antes de eliminar nada, se comprobó que el grupo estaba vacío:

```bash
az resource list --resource-group rg-azure-01-lab --query "length(@)" --output tsv
# Resultado confirmado: 0
```

El 23/10/2026 se eliminó el grupo, confirmando interactivamente la operación:

```bash
az group delete --name rg-azure-01-lab
# Confirmación manual: y

az group exists --name rg-azure-01-lab
# Resultado confirmado: false
```

**Estado final: `rg-azure-01-lab` eliminado.** Este comando es destructivo: eliminar un grupo borra los recursos que contenga. Si el laboratorio se reproduce, revisar siempre sus contenidos antes del borrado.

## Comprobación de costes

El 23/10/2026, Azure Education mostraba 0,00 € de coste mensual y crédito restante de 88 €. La vista **Análisis de costes** generaba el error de oferta `WebDirect/AIRS`, pero el presupuesto configurado seguía visible. Utilizar **Education > Información general** para consultar crédito y gasto mientras persista la incidencia. Las alertas **no cortan automáticamente la facturación**. No publicar identificadores de suscripción, tokens o detalles personales en GitHub.

Documentación oficial:
- https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-cli
- https://learn.microsoft.com/en-us/cli/azure/group
