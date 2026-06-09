# M3 — Delegación y RBAC

[← M2](../M2-inventario/README.md) · [Siguiente: Segmentación del parque →](../M3-segmentacion-parque/README.md) · [Inicio del curso](../../README.md)

## Qué aprenderás

Delegar administración sin perder control del producto:

- Crear un **rol** con permisos mínimos (matriz Full / Write / Read / No Access).
- Configurar **correo de laboratorio** para activación de usuarios.
- Crear un **usuario** técnico y definir **scope** en consola.
- Probar el login del usuario delegado.

**Concepto clave:** el **rol** define *qué puede hacer*; el **scope** define *sobre qué equipos* (se aplica con grupos en el [siguiente capítulo](../M3-segmentacion-parque/README.md)).

---

## Laboratorios de este módulo

| Ejercicio | Título |
|-----------|--------|
| [01 — Admin y roles](01-admin-y-roles.md) | Navegar Admin y crear rol `lab-read` |
| [02 — SMTP de laboratorio](02-smtp-laboratorio.md) | Correo para activación de usuarios |
| [03 — Usuario y scope](03-usuario-y-scope.md) | Alta de `tecnico1` con scope inicial |
| [04 — Activación y prueba](04-activacion-y-prueba.md) | Correo, contraseña y login limitado por rol |

---

## Qué debes dominar al terminar

- Crear rol custom y explicar la matriz de permisos.
- Diferenciar **All Computers**, **Static Unique Group**, **Remote Office** en scope.
- Activar un usuario vía correo de lab y verificar limitaciones de **rol**.

**Siguiente:** [Segmentación del parque (grupos)](../M3-segmentacion-parque/README.md)

**Empieza:** [01 — Admin y roles](01-admin-y-roles.md)
