# Laboratorio M5-01 — Tarea programada

[← M5](README.md) · [Siguiente: M5-02 →](02-script-remoto.md)

Objetivo: crear una tarea **programada** que lance un escaneo periódico en `ec-client1` (inventario o parches).

---

### Paso 1 — Elegir qué automatizar

Dos candidatos habituales en EC:

| Tipo | Ruta típica | Para qué |
|------|-------------|----------|
| **Asset / Inventory scan** | `Inventory → Schedule Scan` o `Admin → Scheduler` | Inventario actualizado sin pedir scan manual (M2) |
| **Patch scan** | `Patch Management → Schedule → Scan Systems` | Detectar missing sin entrar cada día al dashboard (M4) |

Elige **una** para este ejercicio. Usaremos **scan de inventario** como ejemplo (también válido: scan de parches).

---

### Paso 2 — Abrir programador

Ruta ejemplo (inventario):

```
Inventory → Computers → Schedule Scan
```

Alternativa centralizada:

```
Admin → Scheduler → Add Task
```

(o **Tools → System Manager → Scheduler**).

**Referencia — programador:**

![Scheduler](../../capturas/M5/01-scheduler.png)

---

### Paso 3 — Configurar la tarea

| Campo | Valor lab |
|-------|-----------|
| Nombre | `Lab-Scan-ec-client1-Daily` |
| Tipo de tarea | Asset Scan / Inventory Scan |
| Target | **`ec-client1`** (o grupo con solo ese equipo) |
| Frecuencia | **Daily** / una vez al día |
| Hora | Fuera de tu horario de clase (p. ej. 07:00) o **una ejecución** en 15 min para comprobar el resultado en la misma sesión |

Opciones que revisas aunque no cambies:

- **Retry** si el equipo está apagado.
- **Notificación** al admin si falla (email — requiere SMTP de M3).

Guarda la tarea.

---

### Paso 4 — Comprueba

- La tarea aparece en **Scheduled Tasks** / listado del scheduler.
- El target es **solo** `ec-client1`, no All Computers (blast radius).
- Si programaste ejecución cercana, espera y verifica en **Inventory → Computers** que **Last scan** se actualiza (como M2-04).

---

## Antes de seguir

Has pasado de scan manual a scan **recurrente**.

### Pon el foco en

- Programar no elimina la **latencia** del agente — solo automatiza el disparo.
- Target acotado = misma lección que M3 scope y M4 piloto.
- En producción combinas scan programado + alertas cuando **Last scan** supera X días.

### Preguntas de cierre

1. ¿Scan diario a las 07:00 en 5.000 PCs? ¿Qué riesgo de carga en servidor y red?
2. ¿Programarías patch scan con la misma frecuencia que inventory scan? ¿Por qué sí o no?
3. Si el PC está apagado a las 07:00, ¿qué esperas del comportamiento **retry**?
4. ¿Dónde documentarías esta tarea para un auditor? (nombre, target, frecuencia, propietario)

→ **[M5-02 — Script remoto](02-script-remoto.md)**
