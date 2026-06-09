# Laboratorio M7-02 — Informe despliegue y parches

[← M7-01](01-informe-inventario.md) · [M7](README.md) · [Siguiente: M7-03 →](03-kpis-y-trazabilidad.md)

Objetivo: generar informes que demuestren **compliance de parches** (M4) y **estado de despliegues** (M6/M5).

---

### Paso 1 — Informe de parches

En **Reports**, localiza:

| Informe | Uso |
|---------|-----|
| **Patch Status** / **Systems by Patch Status** | % missing, critical, compliant |
| **Missing Patches** | Lista de KB pendientes por equipo |
| **Patch Deployment Status** | Resultado de tareas (Success/Failed) |

Genera **Patch Status** filtrado por `ec-client1`.

**Referencia — patch report:**

![Patch report](../../capturas/M7/03-patch-report.png)

**Comprueba:**

- Refleja el trabajo de M4 (missing reducidos si desplegaste, o estado coherente si no).
- Identificas al menos un indicador **compliant** vs **non-compliant**.

---

### Paso 2 — Informe de despliegue de software

Si completaste M6 (`Chrome-Lab`):

```
Reports → Software Deployment Reports
```

(o **Deployment Status** / **Install Status**).

| Dato a buscar | Relación |
|---------------|----------|
| Package `Chrome-Lab` | M6-01 |
| Target `ec-client1` | M6-02 |
| Estado Success / Failed | M6-03 |

Exporta un extracto (PDF o CSV).

Si no desplegaste Chrome, usa el informe vacío o en **Failed** como ejercicio de lectura — documenta «sin datos por tarea no ejecutada».

---

### Paso 3 — Informe de configuraciones / scripts

Para M5 (`Lab-Marker-Script`):

```
Reports → Configuration Reports
```

(o **Script Execution** / **Configuration Deployment Status**).

**Comprueba:** trazabilidad de ejecución del script en `ec-client1`.

---

### Paso 4 — Vista compliance unificada

Construye una tabla **compliance snapshot**:

| Equipo | Parches critical missing | Último deploy software | Último script/scan auto |
|--------|--------------------------|------------------------|-------------------------|
| ec-client1 | | | |
| ec-server | | | |

Esta tabla es lo que un responsable operativo miraría en una reunión de 15 minutos.

---

## Antes de seguir

Reporting convierte acciones dispersas (M4, M5, M6) en **evidencia única**.

### Pon el foco en

- **Patch report** = compliance de seguridad; **deploy report** = cumplimiento de software estándar.
- Los informes muestran **estado en el momento de generar** — programa informes recurrentes si necesitas serie temporal.
- Para auditoría externa: export + fecha + alcance (qué equipos incluidos).

### Preguntas de cierre

1. ¿Qué informe enviarías al CISO cada lunes? ¿Solo missing critical?
2. Si Patch dice compliant pero Inventory no lista un software obligatorio, ¿hay contradicción real?
3. ¿Cómo demostrarías que el piloto M4 (`Pilot-Deploy-Lab-01`) se ejecutó antes de escalar?
4. Nombra **dos audiencias** (CISO, helpdesk, CAB) y qué informe le darías a cada una.

→ **[M7-03 — KPIs y trazabilidad](03-kpis-y-trazabilidad.md)**
