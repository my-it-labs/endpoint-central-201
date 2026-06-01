# M3 — Segmentación, gobierno y RBAC (5 h)

[← M2](../M2-inventario/README.md) · [Inicio del curso](../../README.md)

## Qué aprenderás

Delegar administración sin perder control:

- Crear un **rol** con permisos mínimos (matriz Full / Write / Read / No Access).
- Crear un **usuario** técnico con **scope** (sobre qué endpoints actúa).
- Configurar **correo de laboratorio** para activación de usuarios.
- Probar el login del usuario delegado.

**Concepto clave:** el **rol** define *qué puede hacer*; el **scope** define *sobre qué equipos*.

---

## Laboratorios de este módulo

| Ejercicio | Título |
|-----------|--------|
| [01 — Admin y roles](01-admin-y-roles.md) | Navegar Admin y crear rol `lab-read` |
| [02 — SMTP de laboratorio](02-smtp-laboratorio.md) | Correo para activación de usuarios |
| [03 — Usuario y scope](03-usuario-y-scope.md) | Alta de `tecnico1` con alcance |
| [04 — Activación y prueba](04-activacion-y-prueba.md) | Correo, contraseña y login limitado |

Apoyo: [Mapa de opciones UI](../../docs/mapa-opciones-ui.md)

---

## Qué debes dominar al terminar M3

- Crear rol custom y explicar la matriz de permisos.
- Diferenciar **All Computers**, **Static Unique Group**, **Remote Office** en scope.
- Activar un usuario vía correo de lab y verificar sus limitaciones.

**Empieza:** [01 — Admin y roles](01-admin-y-roles.md)
