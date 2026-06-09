# Laboratorio M7-01 — Informe de inventario

[← M7](README.md) · [Siguiente: M7-02 →](02-informe-despliegue-parches.md)

Objetivo: generar un **informe de inventario** que sirva de baseline del parque de lab (`ec-server`, `ec-client1`).

---

### Paso 1 — Abrir Reports

Menú lateral:

```
Reports
```

(o **Report** / **Analytics**, según versión).

**Referencia — módulo Reports:**

![Reports](../../capturas/M7/01-reports-home.png)

---

### Paso 2 — Informe predefinido de inventario

Busca informes del tipo:

| Informe (nombre aproximado) | Contenido |
|-----------------------------|-----------|
| **Computer Inventory** / **Hardware Inventory** | CPUs, RAM, disco, modelo |
| **Software Inventory** | Aplicaciones instaladas por equipo |
| **Software Summary** | Agregado por aplicación (licencias) |

Abre **Computer Inventory** (o el más cercano en tu consola).

**Referencia — informe inventario:**

![Informe inventario](../../capturas/M7/02-inventory-report.png)

---

### Paso 3 — Filtrar al lab

Aplica filtros para no mezclar ruido:

| Filtro | Valor |
|--------|--------|
| Equipos | `ec-client1` (y opcional `ec-server`) |
| Dominio / grupo | WORKGROUP o grupo de lab |
| Período | Último inventario disponible |

Genera el informe (**Generate** / **Run Report**).

**Comprueba:**

- Aparecen filas para tus VMs de lab.
- Datos coherentes con M2 (Software, Computers, Hardware).

---

### Paso 4 — Exportar baseline

Exporta para evidencia:

```
Export → PDF / CSV / XLS
```

Guarda como `baseline-inventario-lab` (nombre sugerido).

Anota:

- Fecha/hora del informe.
- Nº de equipos incluidos.
- Un dato que **coincida** con lo visto en M2 (p. ej. RAM, OS build, Chrome si desplegaste en M6).

---

## Antes de seguir

Un informe de inventario es **foto** del parque en un momento — no monitor en tiempo real.

### Pon el foco en

- **Baseline** = referencia para comparar en el tiempo («¿qué cambió tras el despliegue?»).
- Software Inventory y Computer Inventory responden preguntas distintas (M2) — elige el informe según audiencia.
- Export CSV para BI; PDF para auditoría o CAB.

### Preguntas de cierre

1. ¿Qué diferencia hay entre este informe y mirar **Inventory → Software** en vivo?
2. Si un auditor pide «lista de PCs con &lt;8 GB RAM», ¿qué informe y qué filtro?
3. ¿Con qué frecuencia generarías baseline en producción? (mensual, trimestral…)
4. ¿El informe incluye equipos sin agente o sin scan reciente? ¿Cómo lo detectarías?

→ **[M7-02 — Informe despliegue/parches](02-informe-despliegue-parches.md)**
