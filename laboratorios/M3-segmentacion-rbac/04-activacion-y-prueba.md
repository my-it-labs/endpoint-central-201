# Laboratorio M3-04 — Activación y prueba

[← M3-03](03-usuario-y-scope.md) · [M3](README.md) · [Siguiente módulo: M4 →](../M4-parches/README.md)

Objetivo: activar `tecnico1` desde el correo de lab e iniciar sesión comprobando **limitaciones** del rol.

---

### Paso 1 — Localizar el correo de activación

Abre la bandeja SMTP de laboratorio (Mailpit u otra):

- Host: `http://127.0.0.1:8025` (Mailpit típico)

Busca el mensaje para `tecnico1` con enlace de activación.

---

### Paso 2 — Abrir el enlace de activación

**Importante:** si el enlace usa hostname `ec-server` y tu navegador no lo resuelve, sustituye por IP:

```
http://192.168.56.10:8020/...
```

(o el puerto que use tu trial). Si aparece error 400, revisa hostname, puerto y protocolo en el enlace del correo.

Define una contraseña para `tecnico1` y completa la activación.

---

### Paso 3 — Login como técnico

Cierra sesión de admin (o ventana privada) e inicia sesión con:

- Usuario: `tecnico1`
- Contraseña: la que acabas de definir

---

### Paso 4 — Verificar limitaciones

Recorre el menú y comprueba:

| Debe poder | No debe poder (según lab-read) |
|------------|--------------------------------|
| Ver Inventory (lectura) | Cambiar configuración de Admin |
| Ver Reports (lectura) | Crear despliegues / parches si están en No Access |
| Ver equipos dentro de su scope | Ver equipos fuera de scope (si usaste grupo limitado) |

---

## Antes de seguir

Has completado el ciclo **crear rol → crear usuario → activar → probar limitaciones**. Eso es RBAC operativo, no teoría.

### Pon el foco en

- Delegación = **rol + scope + activación segura** (correo, contraseña, opcionalmente 2FA).
- Logueado como `tecnico1` el menú debe ser **visiblemente más pobre** que como admin.
- Si `tecnico1` puede hacer algo que no debería, el fallo está en la matriz del rol, no en el usuario.

### Reto (tómate tu tiempo)

1. Enumera **tres diferencias** concretas entre admin y `tecnico1` (menús que desaparecen, botones deshabilitados…).
2. Intenta llegar a **Admin → Add User** como `tecnico1`: ¿qué ocurre? ¿Es el comportamiento esperado?
3. Cierra sesión del técnico y vuelve como admin. ¿Por qué no conviene dejar sesiones admin abiertas en puesto compartido?
4. Reflexiona: ¿un auditor debería tener Write en Inventory o solo Read? Anótalo en tu cuaderno.

Cuando el contraste admin/técnico te resulte obvio, cierra M3.

→ **[M4 — Parches](../M4-parches/README.md)** — si aún no hay ejercicios publicados, continúa con **[M6 — Despliegue de software](../M6-software/README.md)** y vuelve a M4 después.
