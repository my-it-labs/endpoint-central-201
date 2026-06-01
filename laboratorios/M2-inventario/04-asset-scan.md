# Laboratorio M2-04 — Asset Scan

[← M2-03](03-inventario-hardware.md) · [M2](README.md) · [Siguiente módulo: M3 →](../M3-segmentacion-rbac/README.md)

Objetivo: lanzar un **Asset Scan** sobre `ec-client1` y entender la diferencia entre *acción lanzada* y *inventario actualizado*.

---

### Paso 1 — Ir al detalle del equipo

```
Inventory → Computers → ec-client1
```

(o desde **Agent → Managed Computers** → detalle del mismo equipo).

---

### Paso 2 — Abrir Actions

Busca el menú o botón **Actions** (acciones sobre el endpoint).

En el listado localiza:

```
Asset Scan
```

(o **Scan inventory** / equivalente).

---

### Paso 3 — Ejecutar el escaneo

Selecciona **Asset Scan** y confirma.

La consola registrará la tarea. **No esperes** que el inventario cambie al instante en todas las pestañas.

---

### Paso 4 — Verificar después de unos minutos

Espera 2–5 minutos y refresca la vista (el tiempo exacto depende de la carga del agente en tu lab).

Vuelve a:

- **Inventory → Computers** → `ec-client1` → comprueba **Last scan** / último escaneo.
- Opcional: **Software** o **Hardware** si instalaste algo nuevo en el cliente para ver el cambio.

**Comprueba:**

- La fecha de escaneo se actualizó, o
- Hay tarea completada en el historial de acciones del equipo.

---

## Antes de seguir

Has visto la diferencia clave: **lanzar acción** ≠ **ver inventario actualizado al instante**.

### Pon el foco en

- **Asset Scan** fuerza recolección en el endpoint vía agente; la consola actualiza cuando el agente responde.
- Software, Computers y Hardware consumen el **mismo inventario** con distintos cortes.
- En operación real no escaneas todo el parque cada minuto: escaneas cuando hace falta (post-instalación, auditoría, incidencia).

### Reto (tómate tu tiempo)

1. ¿Cambió la fecha de **Last scan** en `ec-client1`? Si no, espera un poco más y refresca — observa el retraso.
2. ¿Por qué el inventario **no** cambia en el mismo segundo? Explica el flujo consola → agente → endpoint → vuelta de datos.
3. Propón **dos situaciones reales** en las que pedirías Asset Scan (p. ej. acabas de instalar software a mano en un PC).
4. Vuelve a **Inventory → Software**: ¿verías el cambio antes o después que en la ficha del equipo?

Cierra M2 cuando entiendas esa latencia; es un error muy común en operación.

→ **[M3 — Segmentación y RBAC](../M3-segmentacion-rbac/README.md)**
