# 05 — Traer el repositorio GitHub al ordenador

**Estado:** Pendiente de ejecutar en Ubuntu.

## ¿Qué significa clonar?

Una copia local de un repositorio Git guarda los archivos y el historial. El repositorio remoto se llama normalmente `origin` y apunta a GitHub.

## Preparar Git y clonar

Primero, comprobar que Git está instalado:

```bash
git --version
```

Si no está instalado:

```bash
sudo apt update && sudo apt install -y git
```

Crear una carpeta de trabajo en el home y clonar:

```bash
mkdir -p ~/proyectos/azure
cd ~/proyectos/azure
git clone https://github.com/Andres-Rouco/azure-01-cloud-lab.git
cd azure-01-cloud-lab
```

Verificar estado y remoto:

```bash
git status
git remote -v
git log -1 --oneline
```

La rama debería ser `main`; si el repositorio está recién clonado y no se han editado archivos, debería indicar que el árbol de trabajo está limpio.

## Próxima etapa

Aprender a editar archivos localmente, `git add`, `git commit` y `git push`. Para `git push` por HTTPS GitHub requiere autenticación con Git Credential Manager, GitHub CLI (`gh auth login`) o un token; **no acepta la contraseña habitual**. Si ya existe configuración SSH, se puede usar esa alternativa.

No ejecutar `git init` dentro de esta carpeta clonada, ni copiar credenciales de `~/.azure`.

Fuentes: https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository y https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-authentication-to-github
