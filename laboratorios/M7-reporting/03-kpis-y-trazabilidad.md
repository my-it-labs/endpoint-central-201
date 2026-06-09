# Laboratorio M7-03 — KPIs y trazabilidad

[← M7-02](02-informe-despliegue-parches.md) · [M7](README.md) · [Fin del curso →](../../README.md)

Objetivo: definir un **cuadro de mando operativo mínimo** (KPIs + trazabilidad) para el parque de lab y documentarlo.

---

### Paso 1 — Elegir KPIs realistas

Propón **5 KPIs** medibles con EC en lab o producción:

| KPI | Fuente en EC | Ejemplo lab |
|-----|--------------|-------------|
| % equipos **managed** con agente OK | Agent → Summary | 2/2 = 100 % |
| % equipos **patch compliant** (sin critical missing) | Patch report | Tras M4 |
| % despliegues software **Success** en 7 días | Deployment report | Tras M6 |
| % equipos con **Last scan** &lt; 7 días | Inventory → Computers | Tras M2/M5 |
| Tareas **Failed** abiertas | Patch/Config task history | M4/M5 |

Define **meta** por KPI (p. ej. ≥ 95 % compliant) — en lab las metas son orientativas.

---

### Paso 2 — Trazabilidad de una acción

Elige **una** acción del curso y documenta la cadena completa:

Ejemplo: despliegue piloto de parches M4-04.

| Campo | Valor |
|-------|--------|
| **Quién** | Admin EC (usuario consola) |
| **Qué** | Parches aprobados X, Y, Z |
| **Cuándo** | Fecha/hora tarea `Pilot-Deploy-Lab-01` |
| **Dónde** | Grupo `Grupo-Clientes` → ec-client1 |
| **Resultado** | Success / Failed / Reboot Required |
| **Evidencia** | Export informe M7-02 + captura Deployment Status |

Documenta la misma cadena de trazabilidad para **Chrome-Lab** (M6) o **Lab-Marker-Script** (M5).

---

### Paso 3 — Dashboard operativo (manual o consola)

Si tu consola ofrece **dashboard** personalizable:

```
Reports → Dashboard
```

(o **Home → Custom Dashboard**).

Añade widgets útiles:

- Managed computers count
- Critical missing patches
- Recent deployment status

Si no hay dashboard, documenta un **one-pager** con los 5 KPIs y frecuencia de revisión.

**Referencia — dashboard (opcional):**

![Dashboard operativo](../../capturas/M7/04-dashboard.png)

---

### Paso 4 — Programar informe recurrente (opcional)

Programa un informe automático:

```
Reports → [informe elegido] → Schedule Report
```

| Campo | Valor lab |
|-------|-----------|
| Frecuencia | Weekly |
| Destinatario | `admin@lab.local` (requiere SMTP M3) |
| Formato | PDF |

**Comprueba:** la programación queda guardada (el correo puede verse en Mailpit si SMTP está activo).

---

### Paso 5 — Cierre del curso

Resume el recorrido del curso:

1. Qué es EC y papel del agente (M1).
2. Tres vistas de inventario (M2).
3. Rol + scope + activación (M3).
4. Ciclo de parches piloto → escala (M4).
5. Automatización con histórico (M5).
6. Deploy software template → package → policy (M6).
7. Reporting para compliance (M7).

---

## Antes de seguir — fin del recorrido

Has completado los **25 h** del temario: operar, delegar, parchear, automatizar, desplegar y **demostrar** con informes.

### Pon el foco en

- KPI sin **fuente** y **frecuencia** es decoración — define ambos.
- Trazabilidad = quién/qué/cuándo/dónde/resultado/evidencia (cadena de auditoría).
- El cuadro operativo une módulos que en silos parecen desconectados.

### Preguntas de cierre

1. ¿Son medibles y accionables tus 5 KPIs?
2. ¿Qué KPI **no** pondrías? (vanity metric — p. ej. «clics en consola»).
3. Si entras por primera vez como nuevo admin EC, ¿qué tres informes generas el día 1?
4. ¿Qué proceso de tu empresa mejorarías primero con esta visibilidad?

Cuando tu cuadro KPI + trazabilidad esté documentado, **has terminado el curso**.

→ **[Inicio del curso](../../README.md)**
