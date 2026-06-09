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

## 5) Parches no escanean o no despliegan

- [ ] ¿Último **patch scan** reciente en `Patch Management → Systems`?
- [ ] ¿Parches en estado **Approved** (no solo Missing)?
- [ ] ¿Target es el grupo correcto (`Grupo-Clientes`, no All Computers por error)?
- [ ] ¿Ventana de mantenimiento ya activa o deploy inmediato configurado?
- [ ] ¿Estado Failed con mensaje (disco, reboot, download)?
- [ ] ¿`ec-client1` online y agente en ejecución?

## 6) Tarea programada / script no ejecuta

- [ ] ¿Tarea habilitada en **Scheduler** / **Scheduled Tasks**?
- [ ] ¿Target acotado al equipo esperado?
- [ ] ¿**Task History** muestra Failed o Skipped?
- [ ] ¿Script con permisos y ruta válida (`C:\Temp` en lab)?
- [ ] ¿Mismo patrón de espera que deploy (`Yet to Apply`)?

## 7) Informes vacíos o incoherentes

- [ ] ¿Filtro de equipos incluye `ec-client1` / grupo de lab?
- [ ] ¿Inventario o scan previo (M2/M5) antes del informe?
- [ ] ¿Informe generado **después** del despliegue/parche que quieres auditar?
- [ ] ¿Export con fecha y alcance anotados para trazabilidad?

## 8) System Manager no carga (pantalla en blanco)

- [ ] ¿El enlace usa puerto **8444** o **8443**?
- [ ] ¿Reglas firewall en `ec-server` para 8443/8444 desde `192.168.56.0/24`?
- [ ] Workaround: misma URL cambiando `8444` por `8020`.
- [ ] ¿Agente del equipo en **Installed Successfully**?

## 9) “Something went wrong” en UI

- [ ] Hard refresh (`Ctrl+Shift+R`).
- [ ] Nueva pestaña y re-login.
- [ ] Probar navegador host (Chrome/Edge) si webview falla.
- [ ] Verificar que servidor responde en 8383.

## Qué anotar si pides ayuda

- Pantalla exacta y mensaje.
- Acción que estabas ejecutando.
- Hora aproximada.
- Captura del error.
