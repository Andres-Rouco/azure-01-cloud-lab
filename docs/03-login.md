# 03 — Inicio de sesión y selección de suscripción

**Estado:** Pendiente de ejecutar y comprobar.

Requisito: Azure CLI 2.91.0 ya instalada en Ubuntu 26.04.1 LTS.

## 1. Inicio de sesión

```bash
az login
```

En Linux, Azure CLI abre el navegador para autenticar. Usar la cuenta vinculada a Azure for Students y completar MFA si se solicita. Desde Azure CLI 2.61.0 puede aparecer un selector de suscripción; seleccionar **Azure for Students**, no otra cuenta de pago.

Si el navegador no se abre:

```bash
az login --use-device-code
```

Seguir las instrucciones en pantalla. **Nunca compartir el código temporal ni credenciales.**

## 2. Verificar cuenta activa sin mostrar identificadores

```bash
az account show --query "{Subscription:name,State:state,Default:isDefault}" --output table
```

Salida esperada: nombre Azure for Students, estado Enabled y Default True.

Si se necesita listar opciones:

```bash
az account list --query "[].{Subscription:name,State:state,Default:isDefault}" --output table
```

Para cambiar de suscripción (solo si el nombre es inequívoco):

```bash
az account set --subscription "Azure for Students"
```

Ejecutar la comprobación de nuevo.

## 3. Seguridad

- No hacer `git add` de `~/.azure/`.
- No compartir tokens, contraseñas, códigos de dispositivo ni identificadores internos.
- No ejecutar todavía comandos que creen servicios de pago.
- Al usar un equipo compartido, se puede salir con `az logout`.

Fuentes:
- https://learn.microsoft.com/cli/azure/authenticate-azure-cli-interactively
- https://learn.microsoft.com/cli/azure/manage-azure-subscriptions-azure-cli
