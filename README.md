# Azure 01 — Cloud Lab

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
- [ ] Identificar subversión de Ubuntu 26.
- [ ] Instalar o verificar Azure CLI.
- [ ] Iniciar sesión y comprobar la suscripción activa.
- [ ] Crear y verificar el primer grupo de recursos.
- [ ] Documentar resultados y limpiar recursos de prueba.

## Entorno local

**Ubuntu 26.x**. La subversión exacta está pendiente de comprobar con `lsb_release -a`.

Consulta [Instalación de Azure CLI](docs/02-azure-cli.md) antes de ejecutar comandos de instalación: Microsoft documenta soporte APT para **Ubuntu 26.04 LTS**, pero no debemos asumir que cualquier Ubuntu 26.x es idéntico.

## Nombres previstos

- Grupo de recursos: `rg-azure-01-lab`
- Región: `westeurope`
- Etiquetas: `project=azure-01`, `environment=lab`

Estos son parámetros **propuestos**, no recursos ya desplegados.

## Seguridad y coste

Un grupo de recursos vacío no tiene coste propio. **Las alertas de presupuesto no detienen automáticamente el gasto**. No subir secretos, tokens, ficheros `~/.azure` ni datos de facturación a GitHub.

## Documentación

- [Instalación y verificación de Azure CLI](docs/02-azure-cli.md)
- [Guía oficial de Microsoft](https://learn.microsoft.com/cli/azure/install-azure-cli-linux?pivots=apt)
