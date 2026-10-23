# Azure 01 — Cloud Lab ✅

**Estado: finalizado el 23/10/2026.**

Primer proyecto de la ruta práctica de aprendizaje de Microsoft Azure.

## Objetivos

- Aprender suscripciones, regiones y grupos de recursos.
- Controlar el gasto y revisar el crédito de Azure for Students.
- Usar Azure CLI desde Ubuntu.
- Crear y verificar el primer grupo de recursos.
- Documentar el proceso con Git y GitHub.

## Estado

- [x] Azure for Students activada (confirmación del propietario).
- [x] Presupuesto y alertas configurados (confirmación del propietario).
- [x] Repositorio GitHub creado.
- [x] Identificar subversión: Ubuntu 26.04.1 LTS (`resolute`).
- [x] Instalar y verificar Azure CLI 2.91.0 (salida de `az version` comprobada).
- [x] Iniciar sesión con Azure CLI y comprobar la suscripción activa: Azure for Students, Enabled, True (confirmado mediante salida filtrada).
- [x] Crear y verificar `rg-azure-01-lab` en `westeurope` (`Succeeded`). Se comprobó vacío con `az resource list`.
- [x] Corregir etiqueta escrita `enviroment=lab` y verificar el resultado en Azure CLI.
- [x] Documentar resultados y limpiar recursos de prueba: grupo eliminado; `az group exists` devuelve `false`.

## Entorno local

**Ubuntu 26.04.1 LTS** (`resolute`, amd64), shell Zsh. **Azure CLI 2.91.0** instalada mediante APT y verificada con `az version`.

Consulta la [guía de Azure CLI](docs/02-azure-cli.md), que recoge instalación e incidencia de configuración APT, y la [autenticación](docs/03-login.md).

## Nombres previstos

- Grupo de recursos: `rg-azure-01-lab`
- Región: `westeurope`
- Etiquetas: `project=azure-01`, `environment=lab`

El grupo se creó correctamente en `westeurope`, las etiquetas `project=azure-01` y `environment=lab` se comprobaron mediante Azure CLI y **el grupo se eliminó tras verificar que contenía 0 recursos**.

## Seguridad y coste

Un grupo de recursos vacío no tiene coste propio. En la última consulta a Azure Education (23/10/2026), el coste mensual mostrado era **0,00 €** y quedaban **88 €** de crédito (datos puntuales, no verificación de facturación en tiempo real). Azure for Students mostraba vencimiento del crédito el **23/10/2027**. El presupuesto estaba configurado; **las alertas de presupuesto no detienen automáticamente el gasto**. No subir secretos, tokens, ficheros `~/.azure` ni datos de facturación a GitHub.

## Documentación

- [Instalación y verificación de Azure CLI](docs/02-azure-cli.md)
- [Inicio de sesión y selección de suscripción](docs/03-login.md)
- [Primer grupo de recursos](docs/04-resource-group.md)
- [Clonar el repositorio en Ubuntu](docs/05-local-git.md)
- [Resumen y cierre del proyecto](docs/06-project-completion.md)
- [Guía oficial de Microsoft](https://learn.microsoft.com/cli/azure/install-azure-cli-linux?pivots=apt)
