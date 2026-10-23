# 02 — Azure CLI en Ubuntu 26.04.1 LTS

## Entorno confirmado

- Distribución: Ubuntu 26.04.1 LTS (Resolute)
- Arquitectura: amd64
- Shell: zsh
- `az`: no detectado inicialmente
- Dependencias y clave de Microsoft: instaladas y añadidas
- Incidencia: se escribió el archivo `.sources` en una sola línea. APT devolvía `Entrada 1 mal especificada ... (URI)`.

## Corregir repositorio APT (formato deb822)

Cada campo debe ir en **su propia línea**, con `URIs` escrito correctamente. Ejecutar el bloque completo, sin unir líneas ni editar el texto a mano:

```bash
sudo tee /etc/apt/sources.list.d/azure-cli.sources > /dev/null <<EOF
Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: resolute
Components: main
Architectures: amd64
Signed-By: /etc/apt/keyrings/microsoft.gpg
EOF
```

### Verificar formato

```bash
cat /etc/apt/sources.list.d/azure-cli.sources
sudo apt update
```

Detenerse si `apt update` genera errores. No cambiar `resolute` por otra versión de Ubuntu para intentar resolverlos sin estudiar la causa.

## Instalar y verificar

```bash
sudo apt install azure-cli
az version
```

## Siguiente etapa: autenticación

Solo cuando `az version` funcione:

```bash
az login
az account show --query "{name:name,state:state}" --output table
```

Seleccionar `Azure for Students`. No subir identificadores, tokens ni el directorio `~/.azure` a GitHub.

## Explicación del error

- `$(AZ_DIST)` intenta ejecutar un comando llamado `AZ_DIST`; para obtener el valor de la variable se usa `${AZ_DIST}`.
- Al escribir `Types: deb URIS: ... Suites: ...` en una sola línea, APT no interpreta correctamente los campos de un archivo **deb822**.
- Un *here-document* delimitado por `EOF` garantiza la estructura multilínea cuando se copia correctamente.

Referencias:
- https://learn.microsoft.com/cli/azure/install-azure-cli-linux?pivots=apt
- https://manpages.ubuntu.com/manpages/resolute/en/man5/sources.list.5.html
