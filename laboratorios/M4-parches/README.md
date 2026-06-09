# M4 — Gestión avanzada de parches (6 h)

[← Segmentación del parque](../M3-segmentacion-parque/README.md) · [Inicio del curso](../../README.md)

## Pre-requisito

Haber completado **[Segmentación del parque](../M3-segmentacion-parque/README.md)** (grupo `Grupo-Clientes`).

## Qué aprenderás

Operar el ciclo enterprise de parcheo en Endpoint Central:

- Leer el **estado de parches** del parque (faltantes, críticos, aprobados).
- **Aprobar** parches y definir un **grupo piloto** antes del despliegue masivo.
- Configurar **ventana de mantenimiento** y política de despliegue.
- Desplegar en piloto, revisar resultados y **escalar** con control.
- Interpretar **fallos** y acciones de remediación.

**Concepto clave:** en producción no se parchea «todo a la vez» — se **detecta → aprueba → prueba en piloto → escala → remedia**.

---

## Laboratorios de este módulo

| Ejercicio | Título |
|-----------|--------|
| [01 — Dashboard y faltantes](01-dashboard-y-faltantes.md) | Vista de sistemas y parches missing |
| [02 — Aprobación y grupo piloto](02-aprobacion-y-grupo-piloto.md) | Aprobar parches; usar `Grupo-Clientes` |
| [03 — Ventana de mantenimiento](03-ventana-de-mantenimiento.md) | Policy y ventana para el despliegue |
| [04 — Despliegue piloto](04-despliegue-piloto.md) | Manual Deployment: Approved, policy y `Grupo-Clientes` |
| [05 — Escalado y remediación](05-escalado-y-remediacion.md) | Ampliar alcance y tratar Failed |

---

## Qué debes dominar al terminar M4

- Explicar la diferencia entre parche **detectado**, **aprobado** y **desplegado**.
- Justificar por qué existe un **grupo piloto** antes del parque completo.
- Leer estados de despliegue (Pending, In Progress, Success, Failed, Reboot Required).
- Saber qué revisar primero si un endpoint queda en **Failed**.

**Empieza:** [01 — Dashboard y faltantes](01-dashboard-y-faltantes.md)
