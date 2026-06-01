# Requisitos técnicos — alumnado

## Host de referencia: Windows

El laboratorio está pensado para un **PC con Windows 10 u 11** (64 bits) como máquina anfitriona, con VirtualBox y Vagrant.

| Recurso | Mínimo (apretado) | Recomendado curso |
|---------|-------------------|-------------------|
| SO host | Windows 10/11 64 bits | Igual |
| RAM | 16 GB | **32 GB** |
| CPU | 4 cores | 4+ cores físicos (8+ hilos) |
| Disco libre | 80 GB | **120–150 GB** |

## Imprescindible

- Ejecutar **VMs Windows** dentro de VirtualBox (servidor + cliente)
- **Virtualización** habilitada en BIOS/UEFI
- **Permisos de administrador local** en el PC (instalar VirtualBox/Vagrant, excepciones antivirus)
- Poder instalar **Vagrant** y el plugin **vagrant-vbguest**
- Navegador **Chrome o Edge** en el host para la consola EC (`192.168.56.10`)

## Comprobar antes del curso

- VirtualBox arranca una VM de prueba sin error
- Si falla: revisar **Hyper-V**, **Plataforma de máquina virtual** o **WSL2** (pueden bloquear VirtualBox) con tu departamento IT
- Espacio en disco y RAM suficientes con el resto de aplicaciones cerradas

## No válido como sustituto

- Solo Docker / Codespaces / Linux **sin** VMs Windows para las prácticas
- Solo documentación sin consola EC real

## Entorno virtual (por alumno)

- 1 VM **servidor** (`ec-server`, `192.168.56.10`) — Endpoint Central
- 1 VM **cliente** (`ec-client1`, `192.168.56.11`) — agente
- Red host-only `192.168.56.0/24` (definida en [`lab/Vagrantfile`](../lab/Vagrantfile))

Arranque: [README — Levantar el laboratorio](../README.md#levantar-el-laboratorio) y [Laboratorio Vagrant](laboratorio-vagrant.md).

## Host Linux (excepcional)

Si tu empresa solo proporciona Linux, es posible con el mismo `Vagrantfile` y grupo `vboxusers`. Ver apartado Linux en [laboratorio-vagrant.md](laboratorio-vagrant.md#host-linux-opcional).

## Setup día 1

Reserva la primera sesión para **preparar el laboratorio** en tu Windows (`vagrant up`, trial EC, agente, snapshot `base-EC-instalado`). Ese día no cuentes con completar un módulo entero.
