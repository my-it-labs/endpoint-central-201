# Laboratorio con Vagrant y VirtualBox

Guía del entorno probado para el curso. El `Vagrantfile` está en [lab/Vagrantfile](../lab/Vagrantfile).

El **host de referencia** para alumnado es **Windows 10 u 11** (64 bits). También puedes usar Linux; al final hay un apartado breve.

---

## Requisitos del host (Windows)

| Recurso | Mínimo | Recomendado |
|---------|--------|-------------|
| SO | Windows 10/11 Pro o Enterprise 64 bits | Igual |
| RAM | 16 GB | **32 GB** |
| Disco libre | 80 GB | **120–150 GB** |
| CPU | 4 cores | 8+ hilos |
| Permisos | Administrador local (instalar software, firewall) | Igual |

Software:

- [VirtualBox](https://www.virtualbox.org/) (última estable; virtualización activada en BIOS)
- [Vagrant](https://www.vagrantup.com/) (instalador Windows; reinicia terminal tras instalar)
- Plugin: `vagrant plugin install vagrant-vbguest`

### Hyper-V y VirtualBox

En muchos portátiles Windows viene **Hyper-V** o **Virtual Machine Platform** activos. Pueden impedir que VirtualBox arranque las VMs o degradar el rendimiento.

- Revisa en *Activar o desactivar características de Windows* si necesitas desactivar **Hyper-V** / **Plataforma de máquina virtual** (según política de tu empresa).
- **WSL2** también usa virtualización; si VirtualBox falla, consulta con soporte IT antes del curso.

### Antivirus y política corporativa

El lab descarga boxes grandes y ejecuta VMs Windows. Puede hacer falta una **excepción** para carpetas de VirtualBox (`%USERPROFILE%\VirtualBox VMs`) y Vagrant (`%USERPROFILE%\.vagrant.d`).

---

## Arranque de las VMs (Windows)

1. Clona o descomprime el repositorio del curso.
2. Abre **PowerShell** o **Símbolo del sistema** (no hace falta administrador para `vagrant up`, sí para instalar VirtualBox).
3. Ejecuta:

```powershell
cd ruta\al\repo\lab
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass   # solo si PowerShell bloquea el script
.\scripts\check-prereqs.ps1
vagrant plugin install vagrant-vbguest   # solo la primera vez
vagrant up
```

La primera vez **descarga** las boxes (varios GB) y puede tardar una hora o más según tu conexión.

### Máquinas y red

| Rol | Nombre Vagrant | Hostname | IP (host-only) |
|-----|----------------|----------|----------------|
| Servidor EC | `ec-server` | `ec-server` | `192.168.56.10` |
| Cliente | `ec-client1` | `ec-client1` | `192.168.56.11` |

Red privada VirtualBox: `192.168.56.0/24`. El adaptador host-only del PC suele ser `192.168.56.1`.

### Acceso a las VMs desde Windows

| Método | Cuándo usarlo |
|--------|----------------|
| Ventana **VirtualBox** | Primera instalación, agente, ver escritorio |
| Navegador en el **host** | Consola EC: `http://192.168.56.10:8020` o `https://192.168.56.10:8383/webclient` |
| **Escritorio remoto** | Opcional, si habilitas RDP dentro de la VM |

Usuario habitual de las boxes **gusztavvargadr**: `vagrant` / `vagrant` (confirma en [Vagrant Cloud](https://portal.cloud.hashicorp.com/vagrant/discover) si cambia).

### Comandos útiles (PowerShell, carpeta `lab`)

```powershell
vagrant status
vagrant halt
vagrant reload
vagrant destroy -f    # borra las VMs (no elimina las boxes descargadas)
```

---

## Primer arranque dentro de las VMs

- **Ctrl+Alt+Supr** en bloqueo: en VirtualBox, **Entrada → Teclado → Insertar Ctrl+Alt+Supr** (o **Host + Supr** según tecla Host).
- Tras apagado brusco: **Shutdown Event Tracker** → rellena **Comment** y **OK**.
- Box cliente del Vagrantfile: `gusztavvargadr/windows-10` (no uses `windows-10-enterprise` en Vagrant Cloud; puede dar 404).

---

## Instalar Endpoint Central (trial)

En **`ec-server`** (ventana de la VM o RDP):

1. Descarga el instalador de **evaluación** desde ManageEngine (navegador dentro de la VM).
2. Instala con opciones por defecto (SQL Express integrado si el asistente lo ofrece).
3. Anota los **puertos** del resumen final (habitual: **8020** HTTP, **8383** HTTPS).
4. Si aparece **`firewallException.bat`**: en el servidor de consola suele ser correcto **Sí** (administrador).
5. Prueba la consola **desde tu Windows host** en Edge/Chrome: `http://192.168.56.10:8020`.

En **`ec-client1`**:

1. Desde la consola EC, descarga el **agente** (MSI de tu servidor).
2. Instálalo apuntando a `192.168.56.10`.
3. En **Agent → Computer(s) for approval**, aprueba `ec-client1` si está **Pending**.
4. Verifica equipos gestionados (módulo M1).

**Trial:** límites de equipos y tiempo según ManageEngine. Solo laboratorio aislado, nunca producción.

---

## Firewall en el servidor (si hay timeout desde cliente o host)

Síntoma: `http://192.168.56.10:8020` no responde desde `ec-client1` o desde tu PC, pero sí dentro de `ec-server`.

En **PowerShell como administrador** en la VM **`ec-server`**:

```powershell
Get-NetConnectionProfile
Set-NetConnectionProfile -InterfaceIndex <id> -NetworkCategory Private   # interfaz host-only, si esta como Public

New-NetFirewallRule -DisplayName "Lab-EC-8020" -Direction Inbound -Protocol TCP -LocalPort 8020 -RemoteAddress 192.168.56.0/24 -Action Allow
New-NetFirewallRule -DisplayName "Lab-EC-8383" -Direction Inbound -Protocol TCP -LocalPort 8383 -RemoteAddress 192.168.56.0/24 -Action Allow
New-NetFirewallRule -DisplayName "Lab-EC-8027" -Direction Inbound -Protocol TCP -LocalPort 8027 -RemoteAddress 192.168.56.0/24 -Action Allow
New-NetFirewallRule -DisplayName "Lab-EC-8444" -Direction Inbound -Protocol TCP -LocalPort 8444 -RemoteAddress 192.168.56.0/24 -Action Allow
New-NetFirewallRule -DisplayName "Lab-EC-8443" -Direction Inbound -Protocol TCP -LocalPort 8443 -RemoteAddress 192.168.56.0/24 -Action Allow
```

Los puertos **8443/8444** son los de **Tools** (System Manager, remote control, chat). Sin ellos, los enlaces que EC abre desde **Actions → System Manager** pueden quedarse cargando en blanco.

Comprueba desde el cliente:

```powershell
Test-NetConnection 192.168.56.10 -Port 8027
```

El **ping** puede fallar aunque HTTP funcione. No uses solo ping.

Más incidencias: [Checklist de incidencias](../manual-alumno/checklist-incidencias-lab.md).

---

## Snapshots (recomendado)

Con Endpoint Central y agente funcionando:

1. Apaga o deja estable cada VM (`vagrant halt` o apagado ordenado).
2. VirtualBox → cada VM → **Instantáneas** → `base-EC-instalado`.
3. Al empezar cada sesión del curso, **restaura** esa instantánea.

---

## SMTP para M3 (host Windows)

Mailpit u otro SMTP local en tu PC: el servidor EC en la VM debe alcanzar el host en `192.168.56.1` (red host-only). Detalle: [SMTP de laboratorio](smtp-laboratorio.md).

---

## Host Linux (opcional)

Si tu host es Linux:

```bash
cd lab
chmod +x scripts/check-prereqs.sh
./scripts/check-prereqs.sh
vagrant plugin install vagrant-vbguest
vagrant up
```

Tu usuario debe estar en el grupo **`vboxusers`** (`sudo usermod -aG vboxusers "$USER"` y nueva sesión). Sin eso, VirtualBox puede devolver `E_ACCESSDENIED`.

---

## Licencias

Imágenes de evaluación Microsoft y trial ManageEngine solo para laboratorio, según sus términos.
