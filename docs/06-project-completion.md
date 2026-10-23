# 06 — Cierre del laboratorio Azure 01

**Fecha de cierre:** 23/10/2026  
**Estado:** Completado y recursos de prueba eliminados.

## Entorno y acceso
- Equipo: Ubuntu 26.04.1 LTS (Resolute), arquitectura amd64, shell Zsh.
- Azure CLI: versión 2.91.0.
- Git: versión 2.52.0.
- Suscripción activa y verificada: Azure for Students, Enabled, Default True.
- Azure CLI inició sesión correctamente pese a advertencias transitorias del navegador.

## Recursos creados
| Concepto | Valor |
| --- | --- |
| Grupo de recursos | `rg-azure-01-lab` |
| Región | `westeurope` |
| Etiqueta `project` | `azure-01` |
| Etiqueta `environment` | `lab` |
| Estado de aprovisionamiento | `Succeeded` |
| Servicios dentro del grupo | Ninguno |

Se corrigió el error tipográfico inicial `enviroment` por `environment`.

## Pruebas finales — salidas confirmadas

```bash
az resource list --resource-group rg-azure-01-lab --query "length(@)" --output tsv
# 0

az group delete --name rg-azure-01-lab
# Confirmación interactiva: y

az group exists --name rg-azure-01-lab
# false
```

La comprobación `false` indica que el grupo ya no existía después de la eliminación. No se dejó el grupo de laboratorio desplegado.

## Costes y observabilidad

- El 23/10/2026, **Azure Portal > Education > Información general** mostraba 88 € de 88 € disponibles y 0,00 € de coste acumulado durante octubre.
- La fecha de caducidad mostrada para el crédito era 23/10/2027.
- Se confirmó que existía el presupuesto de 10 € con alertas.
- La vista **Análisis de costes** no cargaba, con error relativo al tipo de oferta `WebDirect/AIRS`. El portal de patrocinio de Azure no mostraba un Sponsorship activo. Estas incidencias **no impidieron consultar el crédito desde Azure Education**.
- Las cifras de coste reflejan la vista de Education en el momento de la consulta, no una garantía de costes futuros.
- Hay un recordatorio configurado para revisar el crédito en septiembre de 2027.

## GitHub

Repositorio: [azure-01-cloud-lab](https://github.com/Andres-Rouco/azure-01-cloud-lab)

- Clonado por SSH en `~/proyectos/azure/azure-01-cloud-lab`.
- Primer commit y push local confirmados: `b2ded93`.
- Incidencia en soporte Git HTTPS local pendiente de diagnóstico, sin bloquear el uso de SSH.

## Aprendizajes

Suscripciones y regiones, organización con Resource Groups, etiquetas, Azure CLI, creación e inspección de recursos, comprobación de gastos y crédito estudiantil, eliminación segura, Git/GitHub y documentación reproducible.

## Reproducción futura

Se pueden volver a crear grupos mediante `az group create` o el script correspondiente en `scripts/`, pero hay que revisar previamente la suscripción activa y los costes de cualquier servicio que se añada después.

**No guardar claves, tokens o identificadores sensibles en este repositorio público.**
