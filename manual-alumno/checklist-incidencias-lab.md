# Checklist de incidencias de laboratorio

Usar este checklist antes de pedir ayuda. Host de referencia: **Windows** con VirtualBox.

## 0) VirtualBox / Vagrant no arrancan VMs

- [ ] ¿Virtualización activa en BIOS?
- [ ] ¿Hyper-V o “Plataforma de máquina virtual” desactivados (si IT lo permite)?
- [ ] ¿VirtualBox y Vagrant instalados y en PATH? (`VBoxManage --version`, `vagrant --version`)
- [ ] ¿Plugin `vagrant-vbguest` instalado?
- [ ] ¿Antivirus bloqueando `VirtualBox VMs` o `.vagrant.d`?
- [ ] ¿Ejecutaste `.\scripts\check-prereqs.ps1` desde la carpeta `lab`?

## 1) No abre la consola

- [ ] ¿URL correcta (`8383` o `8020`)?
- [ ] ¿La VM server está arrancada?
- [ ] ¿Aceptaste excepción de certificado en lab?
- [ ] ¿Pruebas con IP `192.168.56.10` si hostname falla?
- [ ] ¿Desde el Windows host en Chrome/Edge (no solo dentro de la VM)?

## 2) No aparece endpoint en consola

- [ ] ¿Agente instalado en cliente?
- [ ] ¿Servicio del agente en ejecución?
- [ ] ¿Firewall del server permite puertos del lab?
- [ ] ¿Aprobación pendiente en Agent/SoM?

## 3) Add User no termina / activación falla

- [ ] ¿SMTP configurado y test mail correcto?
- [ ] ¿Mailpit/smtp4dev levantado?
- [ ] ¿Enlace de activación completo (token intacto)?
- [ ] ¿Token caducado? Reenviar activación.
- [ ] ¿URL con protocolo/puerto correctos?

## 4) Despliegue software no aplica

- [ ] Estado en `View Configurations` (`Yet to Apply`, etc.).
- [ ] Target correcto (domain/remote office/grupo).
- [ ] Policy adecuada (sin restricciones no deseadas).
- [ ] Endpoint online y con agente activo.

## 5) “Something went wrong” en UI

- [ ] Hard refresh (`Ctrl+Shift+R`).
- [ ] Nueva pestaña y re-login.
- [ ] Probar navegador host (Chrome/Edge) si webview falla.
- [ ] Verificar que servidor responde en 8383.

## Qué anotar si pides ayuda

- Pantalla exacta y mensaje.
- Acción que estabas ejecutando.
- Hora aproximada.
- Captura del error.
