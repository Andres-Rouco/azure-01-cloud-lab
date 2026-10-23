# 02 — Azure CLI en Ubuntu 26

## 1. Confirmar versión exacta

```bash
lsb_release -a
```

La guía oficial de Microsoft enumera Ubuntu 26.04 LTS (Resolute Raccoon) como distribución probada con paquetes APT de Azure CLI. La compatibilidad de otras subversiones de Ubuntu 26 no debe darse por supuesta.

## 2. Comprobar si ya está instalada

```bash
command -v az && az version
```

## 3. Instalar en Ubuntu 26.04 LTS

**Solo después de comprobar que la distribución es Ubuntu 26.04 LTS.** Para aprender de forma controlada, seguimos la instalación paso a paso de Microsoft. Ejecutar cada bloque por separado:

```bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
```

```bash
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc | \
  gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
```

```bash
AZ_DIST=$(lsb_release -cs)
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | \
  sudo tee /etc/apt/sources.list.d/azure-cli.sources
```

```bash
sudo apt-get update
sudo apt-get install -y azure-cli
az version
```

Si Ubuntu 26.04 no coincide con la versión del equipo, o aparece un error de repositorio, **detenerse** y revisar antes de usar un repositorio de otra distribución.

## 4. Inicio de sesión (cuando la instalación esté verificada)

```bash
az login
az account show --query "{name:name,state:state}" --output table
```

Seleccionar la suscripción Azure for Students. No publicar los identificadores de suscripción ni los tokens de inicio de sesión en un repositorio público.

Fuentes oficiales:
- https://learn.microsoft.com/cli/azure/install-azure-cli-linux?pivots=apt
- https://learn.microsoft.com/cli/azure/authenticate-azure-cli-interactively
