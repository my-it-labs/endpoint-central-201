# Capturas de referencia

Imágenes del entorno de laboratorio usadas en los ejercicios como **referencia visual** de cada paso.

**Consola piloto:** `http://192.168.56.10:8020` · Capturas M4 dashboard: **1440×2445** (portrait, con scroll) para incluir KPIs + tablas inferiores.

---

## Estado

| Carpeta | Estado | Archivos |
|---------|--------|----------|
| [M1/](M1/) | ✅ Completo | 4 |
| [M2/](M2/) | ✅ Completo | 3 |
| [M3/](M3/) | ✅ Completo | 11 |
| [M4/](M4/) | ⏳ En curso | 6 / 10 |
| [M5/](M5/) | ⏳ Pendiente | 3 |
| [M6/](M6/) | ✅ Completo | 7 |
| [M7/](M7/) | ⏳ Pendiente | 4 |

---

---

## M3 — grupos (parque)

| Archivo | Estado | Qué capturar |
|---------|--------|--------------|
| `M3/08-custom-groups-list.png` | ✅ | `Admin → Custom Group → Computer` — lista + botón Create New Group |
| `M3/09-grupo-clientes-members.png` | ✅ | Create New Computer Group — Static Unique, Assign manually, miembros en Added |
| `M3/10-scope-static-unique-grupos.png` | ✅ | Add/Edit User — Define Scope, Static Unique Group, dropdown Clientes / Servidores |
| `M3/11-inventory-scope-contrast.png` | ✅ | Inventory → Computers — admin (3 PCs) vs tecnico1 (sin ec-server) |

---

## Pendientes — M4 (parches)

Hazlas en el piloto tras el capítulo de grupos y scan de parches si hace falta.

| Archivo | Qué capturar | Ruta en consola |
|---------|--------------|-----------------|
| `M4/01-patch-management.png` | ✅ | Dashboard Vulnerabilities — portrait 1440×2445 (scroll) |
| `M4/01-patch-management-anotada.png` | ✅ | Misma — marcas 1–10 en cajas de datos (leyenda M4-01) |
| `M4/02-systems-parque.png` | ✅ | Vista **Systems → By Patches** con `ec-client1` (missing, installed) |
| `M4/03-missing-patches.png` | ✅ | **Missing Patches** — tabla con Approve Status (landscape) |
| `M4/03-missing-systems.png` | ✅ | **Missing Systems** — detalle al pulsar el número azul (ec-client1, ec-client2) |
| `M4/04-ec-client1-summary.png` | ✅ | Detalle **Systems → ec-client1 → Summary** |
| `M4/04-test-and-approve-default.png` | ✅ | **Deployment → Test and Approve** — *Automatically without testing* |
| `M4/04-test-and-approve-modified.png` | ✅ | Misma pantalla — *Test and Approve* + *Mark Patch as Not Approved* |
| `M4/04-grupo-piloto.png` | *(opcional)* alias de `M3/09-grupo-clientes-members.png` | Mismo grupo `Grupo-Clientes` |
| `M4/05-test-group-deployment.png` | ✅ | **Test Group Deployment** — formulario completo (1440×2445 portrait) |
| `M4/05-threats-vulnerabilities.png` | ✅ | **Threats → Vulnerabilities** — Summary View + tabla CVE |
| `M4/06-test-groups-overview.png` | ✅ | **Test and Approve** — tarjeta test group *Clientes* |
| `M4/06-deployment-policies.png` | ✅ | **Deployment → Deployment Policies** — listado + Create Policy |
| `M4/06-deployment-policy-create.png` | ✅ | **Create Deployment Policy** — paso 1 Deployment Schedule |
| `M4/06-deployment-policy-pre-deploy.png` | ✅ | **Create Deployment Policy** — paso 2 Pre-deployment Activities |
| `M4/06-deployment-policy-custom-script.png` | ✅ | **Pre-deployment → Custom Script** (opcional; lab: no usar) |
| `M4/06-deployment-policy-details.png` | ✅ | **Deployment Policy Details** — resumen schedule + pre-deploy |
| `M4/06-deployment-policy-post-deploy.png` | ✅ | **Post-deployment settings** — reboot, notify, exclude servers |
| `M4/07-manual-deployment.png` | ✅ | **Manual Deployment** — formulario completo (1440×2445 portrait) |
| `M4/07-manual-deployment-policy-dropdown.png` | ✅ | **Apply Deployment Policy** — desplegable (My Policy 2, Deploy any time…) |
| `M4/08-deployment-status.png` | ✅ | **Test-Cliente-01** — Executed, **Succeeded (2)**, Custom Group Clientes |
| `M4/03-missing-patches-approved.png` | ✅ | **Approved** — 113640 WebView2 en Test-Cliente-01 (Configuration Details) |
| `M4/09-mark-as-approved.png` | ✅ | **Mark as → Approved** — menú abierto (paso 4) |
| `M4/08-install-publish-clientes.png` | ⏳ | **Install/Publish** — formulario paso 3 |
| `M4/09-compliance-policy-groups-tour.png` | ✅ *(opcional)* | **Compliance → Policy Groups** — modal tour (Skip tour) |
| `M4/10-reports-predefined.png` | ✅ *(opcional)* | **Reports → Predefined Reports** (patch / threat / system) |
| `M4/11-update-vulnerability-db.png` | ✅ | **Update Now** — Vulnerability DB (sync proveedor) |

---

## Pendientes — M5 (automatización)

| Archivo | Qué capturar | Ruta en consola |
|---------|--------------|-----------------|
| `M5/01-scheduler.png` | Tarea programada `Lab-Scan-ec-client1-Daily` o formulario de alta | `Admin → Scheduler` o `Inventory → Schedule Scan` |
| `M5/02-custom-script.png` | Configuración script `Lab-Marker-Script` (nombre + tipo PowerShell) | `Configurations → Custom Script` |
| `M5/03-task-history.png` | Histórico con al menos una ejecución (Success/Failed) | `Scheduler → Task History` |

---

## Pendientes — M7 (reporting)

| Archivo | Qué capturar | Ruta en consola |
|---------|--------------|-----------------|
| `M7/01-reports-home.png` | Módulo **Reports** — lista de informes predefinidos | `Reports` |
| `M7/02-inventory-report.png` | Informe inventario generado (filtro `ec-client1`) | `Reports → Computer/Software Inventory` |
| `M7/03-patch-report.png` | Informe patch status o missing | `Reports → Patch Status` |
| `M7/04-dashboard.png` | Dashboard con widgets (o one-pager si no hay dashboard) | `Reports → Dashboard` |

---

## Cómo guardar

1. Captura desde el navegador en el host (sin barra de favoritos si puedes).
2. Guarda con el **nombre exacto** de la tabla en la carpeta indicada.
3. Idioma: el que uses en clase (ES o EN — consistente en todo el curso).
4. Oculta datos sensibles si los hubiera (no debería en lab).

Cuando tengas un lote, dímelo y revisamos que encajan con los laboratorios.
