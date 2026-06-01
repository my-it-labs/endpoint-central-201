# M1 — Arquitectura y fundamentos (3 h)

[← Inicio del curso](../../README.md)

## Qué aprenderás

En este módulo pondrás en marcha la **relación consola ↔ agente ↔ endpoint**:

- Acceder a la consola web de Endpoint Central.
- Entender la pantalla de arranque (Getting Started).
- Leer el resumen del módulo **Agent**.
- Confirmar que tus equipos de laboratorio están **gestionados** correctamente.

Todo lo demás del curso (inventario, RBAC, parches, despliegues) se apoya en esta base.

---

## Contexto (5 minutos)

Endpoint Central centraliza la administración de endpoints Windows mediante un **agente** instalado en cada equipo. La consola muestra el estado del parque; el agente ejecuta acciones y reporta inventario.

En el laboratorio tienes:

| Equipo | Rol |
|--------|-----|
| `ec-server` | Servidor Endpoint Central + consola |
| `ec-client1` | Cliente Windows con agente |

---

## Laboratorios de este módulo

Sigue estos ejercicios **en orden**:

| Ejercicio | Título |
|-----------|--------|
| [01 — Acceso a la consola](01-acceso-consola.md) | Login y pantalla Getting Started |
| [02 — Módulo Agent](02-modulo-agent.md) | Resumen de agentes instalados |
| [03 — Equipos gestionados](03-equipos-gestionados.md) | Tabla Managed Computers |

---

## Qué debes dominar al terminar M1

- Abrir la consola sin bloquearte por certificado o hostname (lab).
- Explicar en una frase qué hace el agente en un endpoint.
- Verificar que **dos equipos** aparecen gestionados con agente OK.

---

**Siguiente:** [01 — Acceso a la consola](01-acceso-consola.md)
