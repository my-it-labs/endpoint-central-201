# Gestión enterprise de endpoints con ManageEngine Endpoint Central

Formación **100 % práctica** — 25 horas.

Aprenderás operando la consola de Endpoint Central sobre un entorno de laboratorio aislado (servidor + clientes Windows con agente). Cada módulo es una secuencia de **laboratorios numerados** que sigues paso a paso.

---

## Levantar el laboratorio

El curso incluye un **`Vagrantfile` probado** en [`lab/`](lab/Vagrantfile): dos VMs Windows en red privada `192.168.56.0/24` (VirtualBox host-only). El host de referencia es **Windows 10/11** con VirtualBox y Vagrant.

| Rol | VM | IP |
|-----|-----|-----|
| Servidor Endpoint Central | `ec-server` | `192.168.56.10` |
| Cliente con agente | `ec-client1` | `192.168.56.11` |

### Requisitos del host (Windows)

- **Windows 10/11** 64 bits, **16 GB** RAM mínimo (**32 GB** recomendado), **~80–120 GB** disco libre
- [VirtualBox](https://www.virtualbox.org/) + [Vagrant](https://www.vagrantup.com/) + plugin **`vagrant-vbguest`**
- Administrador local; revisar **Hyper-V** / antivirus si VirtualBox no arranca VMs
- Detalle: [Requisitos del laboratorio](docs/requisitos-alumno.md)

### 1. Arrancar las VMs (PowerShell)

```powershell
cd ruta\al\repositorio\lab
.\scripts\check-prereqs.ps1
vagrant plugin install vagrant-vbguest   # solo la primera vez
vagrant up
```

La primera ejecución descarga las boxes (varios GB) y puede tardar. Accede por la ventana de VirtualBox; usuario habitual **gusztavvargadr**: `vagrant` / `vagrant`.

*(Host Linux: usa `scripts/check-prereqs.sh` — ver [guía Vagrant](docs/laboratorio-vagrant.md#host-linux-opcional).)*

### 2. Instalar Endpoint Central (trial)

En **`ec-server`** (dentro de la VM):

1. Descarga e instala **Endpoint Central** (evaluación) desde ManageEngine.
2. Anota los puertos del instalador (habitual: **8020** HTTP, **8383** HTTPS).
3. Acepta el diálogo de **firewall** del instalador si aparece.
4. Abre la consola desde tu **Windows host** en Edge/Chrome: `http://192.168.56.10:8020` o `https://192.168.56.10:8383/webclient`.

En **`ec-client1`**:

1. Descarga el **agente** desde tu consola (MSI de esta instalación).
2. Instálalo apuntando a `192.168.56.10`.
3. En la consola, **Agent → approval**, aprueba `ec-client1` si está en **Pending**.

### 3. Comprobar conectividad

- Desde tu PC o desde `ec-client1`, la consola debe responder en **8020** / **8383**.
- Si hay **timeout**, abre reglas de firewall en `ec-server` (PowerShell). Pasos en [Laboratorio Vagrant](docs/laboratorio-vagrant.md#firewall-en-el-servidor-si-hay-timeout-desde-cliente-o-host).

### 4. Snapshot antes del curso

Con servidor + agente OK: en VirtualBox crea la instantánea **`base-EC-instalado`** en cada VM y restáurala al inicio de cada sesión.

### 5. SMTP (módulo M3)

[SMTP de laboratorio](docs/smtp-laboratorio.md) — Mailpit en el host Windows alcanzable desde la VM en `192.168.56.1`.

**Guía ampliada** (Hyper-V, firewall, snapshots, Linux): [docs/laboratorio-vagrant.md](docs/laboratorio-vagrant.md).

---

## Cómo funciona el curso

1. Abre el README del módulo (capítulo).
2. Entra en `01-…md`, `02-…md`, etc. **en orden**.
3. Ejecuta cada **Paso** en la consola.
4. Revisa la **captura de referencia** del material.
5. Al cerrar cada ejercicio, completa **Antes de seguir** (foco + preguntas de cierre).

Más detalle: [Cómo usar este curso](docs/como-se-usa-el-curso.md).

---

## Antes de empezar

| Requisito | Documento |
|-----------|-----------|
| Levantar VMs (Vagrant en Windows) | [lab/](lab/) y [Guía Vagrant](docs/laboratorio-vagrant.md) |
| Hardware y políticas IT | [Requisitos del laboratorio](docs/requisitos-alumno.md) |
| Problemas habituales | [Checklist de incidencias](manual-alumno/checklist-incidencias-lab.md) |
| Notas personales (opcional) | [Cuaderno del alumno](manual-alumno/cuaderno-lab-m1-m7.md) |
| Activación de usuarios (SMTP) | [SMTP de laboratorio](docs/smtp-laboratorio.md) |

**Entorno de lab:** consola en `192.168.56.10` (`:8020` o `:8383`), equipos `ec-server` y `ec-client1`. Usa **Chrome o Edge** en tu Windows host.

---

## Laboratorios del curso (sigue este orden)

| # | Módulo | Horas | Capítulo |
|---|--------|-------|----------|
| **M1** | Arquitectura y fundamentos | 3 h | [laboratorios/M1-arquitectura/](laboratorios/M1-arquitectura/README.md) |
| **M2** | Inventario y organización | 4 h | [laboratorios/M2-inventario/](laboratorios/M2-inventario/README.md) |
| **M3** | Delegación y RBAC | 3 h | [laboratorios/M3-segmentacion-rbac/](laboratorios/M3-segmentacion-rbac/README.md) |
| **M3** | Segmentación del parque (grupos) | 2 h | [laboratorios/M3-segmentacion-parque/](laboratorios/M3-segmentacion-parque/README.md) |
| **M4** | Gestión avanzada de parches | 6 h | [laboratorios/M4-parches/](laboratorios/M4-parches/README.md) |
| **M5** | Automatización operativa | 3 h | [laboratorios/M5-automatizacion/](laboratorios/M5-automatizacion/README.md) |
| **M6** | Despliegue de software | 2 h | [laboratorios/M6-software/](laboratorios/M6-software/README.md) |
| **M7** | Compliance y reporting | 2 h | [laboratorios/M7-reporting/](laboratorios/M7-reporting/README.md) |

**Temario de contenidos:** [docs/temario.md](docs/temario.md)

---

## Empieza aquí

Cuando el laboratorio esté listo (consola + agente aprobado):

→ **[M1 — Arquitectura y fundamentos](laboratorios/M1-arquitectura/README.md)**  
→ Primer ejercicio: [01 — Acceso a la consola](laboratorios/M1-arquitectura/01-acceso-consola.md)
