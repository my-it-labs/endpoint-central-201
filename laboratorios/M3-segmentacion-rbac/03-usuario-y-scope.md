# Laboratorio M3-03 — Usuario y scope

[← M3-02](02-smtp-laboratorio.md) · [M3](README.md) · [Siguiente: M3-04 →](04-activacion-y-prueba.md)

Objetivo: crear el usuario `tecnico1` con rol `lab-read` y definir su **scope**.

---

### Paso 1 — Add User

```
Admin → User Administration → Users → Add User
```

---

### Paso 2 — Paso 1 del asistente (identidad y rol)

Completa:

| Campo | Valor lab |
|-------|-----------|
| User name | `tecnico1` |
| Role | `lab-read` |
| Language | el que prefieras (Español / English) |

Email: usa una dirección válida para el SMTP de lab (p. ej. `tecnico1@lab.local`; el dominio debe ser aceptado por tu servidor SMTP local).

---

### Paso 3 — Paso 2: Define Scope

**Referencia — opciones de scope:**

![Define Scope](../../capturas/M3/05-add-user-scope.png)

Opciones principales:

| Scope | Cuándo usarlo |
|-------|----------------|
| **All Computers** | Todo el parque (lab: aceptable con pocos equipos) |
| **Static Unique Group** | Solo un grupo fijo de equipos |
| **Remote Office** | Solo sedes/oficinas remotas definidas |

Para este ejercicio usa **All Computers** (como en la referencia), salvo que el enunciado de tu entorno pida un scope más restrictivo.

---

### Paso 4 — Confirmar alta

**Referencia — formulario completo:**

![Add User tecnico1](../../capturas/M3/06-add-user-formulario.png)

Pulsa **Add User**. Tras guardar puede aparecer aviso de **Two Factor Authentication**.

**Referencia — alerta 2FA:**

![Alerta 2FA](../../capturas/M3/07-alerta-2fa.png)

En el lab **no activamos 2FA ahora**; es un refuerzo de seguridad para producción. Cierra o pospone la alerta.

---

### Paso 5 — Comprueba

- Usuario `tecnico1` listado en Users.
- Rol `lab-read` asignado.
- Scope coherente con lo elegido.

---

## Antes de seguir

Has unido **rol** (qué puede hacer) y **scope** (sobre qué equipos). Los dos son obligatorios para delegar bien.

### Pon el foco en

- **All Computers** en lab está bien; en producción con 10.000 PCs usarías grupo o remote office.
- **Static Unique Group** fija el alcance a un conjunto concreto de máquinas.
- La alerta **2FA** es recomendación de hardening — en este curso la posponemos, no la ignores en producción.

### Reto (tómate tu tiempo)

1. Repite en voz alta: «El rol `lab-read` permite ___, el scope All Computers limita a ___.» ¿Suena redundante? ¿Por qué hacen falta los dos?
2. Si mañana solo debe ver `ec-client1`, ¿qué scope elegirías en lugar de All Computers?
3. Mira la lista de usuarios: ¿cuántos admins hay? ¿Tiene sentido que todos sean admin en una empresa grande?

→ **[M3-04 — Activación y prueba](04-activacion-y-prueba.md)**
