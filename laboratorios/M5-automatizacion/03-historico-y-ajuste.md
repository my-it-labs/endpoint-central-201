# Laboratorio M5-03 — Histórico y ajuste

[← M5-02](02-script-remoto.md) · [M5](README.md) · [Siguiente módulo: M6 →](../M6-software/README.md)

Objetivo: revisar el **histórico** de tareas automatizadas (scan programado y script), interpretar fallos y **ajustar** configuración.

---

### Paso 1 — Histórico del scheduler

Abre el listado de ejecuciones:

```
Admin → Scheduler → Task History
```

(o **Scheduled Tasks → Execution History**).

**Referencia — task history:**

![Task history](../../capturas/M5/03-task-history.png)

Localiza `Lab-Scan-ec-client1-Daily` (M5-01).

| Columna | Qué anotar |
|---------|------------|
| Last run | ¿Se ejecutó? |
| Status | Success / Failed / Skipped |
| Next run | Próxima ventana |

---

### Paso 2 — Histórico del script

Abre el estado de la configuración `Lab-Marker-Script`:

```
Configurations → Lab-Marker-Script → Execution Status
```

Compara con M6-03:

| Estado | Significado |
|--------|-------------|
| **Yet to Apply** | Aún en cola |
| **Success** | Script ejecutado |
| **Failed** | Revisar causa |

Si **Failed**, abre el detalle del error (código, stderr, permisos).

---

### Paso 3 — Ajustar y reintentar

Practica un ciclo de mejora:

| Problema típico | Ajuste |
|-----------------|--------|
| PC apagado en horario | Cambiar hora o habilitar **retry** |
| Script sin permisos en ruta | Cambiar a `C:\Temp` o ejecutar como System |
| Target demasiado amplio | Reducir a un grupo |
| Policy «solo con usuario logueado» | Cambiar a ejecución en background |

**Haces:**

1. Edita la tarea o configuración.
2. Guarda cambios.
3. **Redeploy** / **Run now** / **Execute once** si la consola lo permite.

**Comprueba:** segunda ejecución en **Success** (o explicación documentada del fallo si el lab no lo permite resolver).

---

### Paso 4 — Auditoría mínima

Tabla resumen:

| Tarea | Target | Frecuencia | Último estado | Acción tomada |
|-------|--------|------------|---------------|---------------|
| `Lab-Scan-ec-client1-Daily` | ec-client1 | Daily | | |
| `Lab-Marker-Script` | ec-client1 | Once | | |

Esto es el embrión del reporting operativo de M7.

---

## Antes de seguir

Automatizar sin revisar histórico es delegar en la oscuridad.

### Pon el foco en

- **Task History** y **Execution Status** son fuentes de verdad — no asumas que «programado = hecho».
- Ajustar target/policy y redeploy es el ciclo normal — no es «fallar», es operación.
- Relaciona con M4 Failed y M6 Yet to Apply: mismos patrones de seguimiento.

### Preguntas de cierre

1. ¿Con qué frecuencia revisarías el histórico de tareas en producción? (diario, semanal…)
2. ¿Qué alerta configurarías si un scan programado falla 3 días seguidos?
3. Diseña una regla: «nadie despliega script a All Computers sin segundo aprobador».
4. ¿Qué información del histórico exportarías para M7?

Cierra M5 cuando sepas programar, acotar y corregir una tarea automática.

→ **[M6 — Despliegue de software](../M6-software/README.md)**
