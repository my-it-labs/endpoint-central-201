# Temario — Endpoint Central (25 h)

Duración total **25 horas**.

## Objetivo

Formar a los participantes en el uso **operativo y organizativo** de Endpoint Central, con foco en:

- Gestión centralizada de endpoints
- Estrategias de parcheo enterprise
- Segmentación y gobierno del parque de equipos
- Delegación administrativa
- Automatización operativa
- Despliegue controlado de software y actualizaciones

## Contexto del cliente

- Licencias activas de Endpoint Central en producción; la formación profundiza en operación enterprise.
- Enfoque **práctico**, escenarios reales de operación.
- Laboratorio: **trial/evaluation** oficial, entornos **aislados** de producción.

## Entorno de laboratorio (por alumno)

- 1 servidor Endpoint Central
- 1–2 endpoints Windows
- Grupos segmentados y políticas diferenciadas

Temas transversales en labs: agentes, organización, grupos dinámicos, scopes, parches, automatización, despliegues, reporting/compliance.

**Setup inicial:** preparación guiada; snapshots o entornos parcialmente preconfigurados para no perder tiempo en instalación.

---

## Módulo 1 — Arquitectura y fundamentos (3 h)

- Conceptos de endpoint management
- Arquitectura de Endpoint Central
- Comunicación mediante agentes
- Operación centralizada del parque

**Laboratorio:** [M1](../laboratorios/M1-arquitectura/README.md) (ejercicios 01–03).

---

## Módulo 2 — Inventario y organización de endpoints (4 h)

- Descubrimiento de equipos
- Inventario hardware / software
- Organización lógica de endpoints
- Etiquetado y clasificación

**Laboratorio:** [M2](../laboratorios/M2-inventario/README.md) (ejercicios 01–04).

---

## Módulo 3 — Segmentación, gobierno y RBAC (5 h)

### Delegación y RBAC (3 h)

- RBAC y delegación de administración
- Roles, SMTP, activación de operadores
- Scope introducido (All Computers en lab)

**Laboratorio:** [M3-segmentacion-rbac](../laboratorios/M3-segmentacion-rbac/README.md) (ejercicios 01–04).

### Segmentación del parque (2 h)

- Custom Groups y organización del parque
- Scope en **Static Unique Group**
- Inventario segmentado por operador
- Puente a parches/despliegues (mismo grupo como target)

**Laboratorio:** [M3-segmentacion-parque](../laboratorios/M3-segmentacion-parque/README.md) (ejercicios 01–02).

Temas transversales M3: scopes administrativos, separación de responsabilidades, un solo EC con operadores segmentados.

---

## Módulo 4 — Gestión avanzada de parches (6 h)

- Ciclo de vida del parche
- Evaluación de vulnerabilidades
- Aprobación y despliegue
- Ventanas de mantenimiento
- Grupos piloto y despliegues progresivos
- Rollback y control operativo

**Laboratorio:** [M4](../laboratorios/M4-parches/README.md).

---

## Módulo 5 — Automatización operativa (3 h)

- Automatización de tareas recurrentes
- Despliegues programados
- Ejecución remota de scripts
- Políticas automatizadas

**Laboratorio:** [M5](../laboratorios/M5-automatizacion/README.md).

---

## Módulo 6 — Despliegue de software y configuración (2 h)

- Creación de paquetes
- Instalación remota
- Distribución segmentada
- Control de versiones

**Laboratorio:** [M6](../laboratorios/M6-software/README.md) (ejercicios 01–03).

---

## Módulo 7 — Compliance, reporting y operación (2 h)

- Reporting operativo
- Seguimiento de despliegues
- Estado de compliance
- Visibilidad y control del parque
- Métricas operativas y trazabilidad
- Buenas prácticas de seguimiento y auditoría

**Laboratorio:** [M7](../laboratorios/M7-reporting/README.md).
