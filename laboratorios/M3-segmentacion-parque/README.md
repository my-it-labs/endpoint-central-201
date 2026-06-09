# M3 — Segmentación del parque (grupos)

[← Delegación y RBAC](../M3-segmentacion-rbac/README.md) · [Inicio del curso](../../README.md)

## Pre-requisitos

Haber completado [Delegación y RBAC](../M3-segmentacion-rbac/README.md): rol `lab-read`, SMTP, usuario `tecnico1` activado.

En RBAC usaste scope **All Computers** para aislar el estudio del **rol**. Aquí creas **grupos** del parque y acotas el scope a un grupo concreto.

**Concepto clave:** el **Custom Group** es un objeto del parque reutilizable (scope de usuario, parches, despliegues, informes).

---

## Qué aprenderás

- Crear **Custom Groups** y asignar endpoints.
- Relacionar **grupo**, **scope** y **target** (no son lo mismo).
- Ajustar scope de `tecnico1` y comprobar **inventario segmentado**.
- Preparar `Grupo-Clientes` para **M4** (target de parches).

---

## Laboratorios de este capítulo

| Ejercicio | Título |
|-----------|--------|
| [01 — Grupos y segmentación](01-grupos-y-segmentacion.md) | Crear `Grupo-Clientes` y `Grupo-Servidores` |
| [02 — Scope, inventario y prueba](02-scope-grupos-y-prueba.md) | Scope en grupo + contraste admin vs técnico |

---

## Qué debes dominar al terminar

- Explicar usos del grupo más allá del scope (M4, M6, M7).
- Demostrar inventario segmentado con `tecnico1`.
- Reutilizar el mismo grupo como target operativo.

**Empieza:** [01 — Grupos y segmentación](01-grupos-y-segmentacion.md)
