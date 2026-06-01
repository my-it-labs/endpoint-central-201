# SMTP de laboratorio (activación de usuarios)

## Problema que resuelve

Endpoint Central necesita correo para activar usuarios nuevos de consola.
Sin SMTP, `Add User` se crea pero no activa correctamente, o bloquea el flujo de activación.

La VM **`ec-server`** debe poder enviar correo al **SMTP en tu Windows host**. En la red host-only del lab, la IP del host suele ser **`192.168.56.1`**.

## Opción A: Mailpit con Docker Desktop (Windows)

Si tienes [Docker Desktop](https://www.docker.com/products/docker-desktop/) en Windows:

```powershell
docker run -d --name mailpit-ec-lab -p 1025:1025 -p 8025:8025 axllent/mailpit
```

- SMTP (desde la VM servidor): `192.168.56.1`, puerto **1025**
- Bandeja web en tu PC: `http://127.0.0.1:8025`

Comprueba desde **`ec-server`** que alcanza el puerto 1025 del host (`Test-NetConnection 192.168.56.1 -Port 1025`). Si falla, revisa firewall de Windows (permitir entrada en 1025 desde `192.168.56.0/24`).

## Opción B: smtp4dev (Windows, sin Docker)

[smtp4dev](https://github.com/rnwood/smtp4dev) en el host Windows: interfaz gráfica, ideal si Docker no está permitido en tu empresa.

- Instala y arranca smtp4dev en el PC host.
- Anota el puerto SMTP que muestra (p. ej. **25** o **2525**).
- En Endpoint Central usa **Server Name** `192.168.56.1` y ese puerto.

## Opción C: Mailpit ejecutable (Windows, sin Docker)

Descarga el binario Windows desde [Mailpit](https://mailpit.axllent.org/) y ejecútalo en el host. Configura el puerto SMTP (p. ej. **1025**) y usa `192.168.56.1` desde la consola EC.

## Configuración en Endpoint Central

- Authentication Type: Basic
- Server Name: `192.168.56.1`
- Port: el de tu Mailpit/smtp4dev (p. ej. `1025`)
- Email Type: SMTP
- TLS: No
- Requires Authentication: No

## Puntos a tener en cuenta

- El enlace del correo de activación debe abrirse en el **mismo navegador/host** donde resuelves la consola (`192.168.56.10`, puerto 8020 o 8383).
- Certificado HTTPS en `8383`: la URL del correo debe coincidir con cómo accedes al lab.
- Error típico: `400 bad request` por token caducado o URL incorrecta.

## Comprobación

1. SMTP configurado y test mail OK.
2. Usuario creado en Admin.
3. Correo visible en Mailpit/smtp4dev.
4. Activación de contraseña completada.
5. Login del usuario técnico validado.

Elige **una** opción y mantén la misma durante todo el módulo M3.
