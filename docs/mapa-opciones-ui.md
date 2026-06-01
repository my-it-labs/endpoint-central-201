# Mapa de opciones de UI (para explicación en clase)

Documento de apoyo para "quemar tiempo con valor": explicar cada opción que cambia comportamiento operativo.

## 1) Add User (Admin -> User Administration -> Users -> Add User)

### Step 1: Add User

- `Authentication type`
  - `Local Authentication`: usuario vive en Endpoint Central.
  - `Active Directory Authentication`: usuario validado contra AD (on-prem).
  - Explicación docente: impacto en onboarding, dependencia de AD, y soporte de incidencias.

- `Role`
  - Define el **qué** puede hacer el usuario en consola.
  - No define sobre qué endpoints: eso lo hace scope.

- `Choose Language`
  - Idioma de interfaz por usuario de consola.
  - No cambia idioma del sistema operativo del servidor.

### Step 2: Define Scope

- `Computers to be managed`
  - `All Computers`: alcance global.
  - `Static Unique Group`: alcance cerrado a grupo único.
  - `Remote Office`: alcance por oficina/sede.

- `Devices to be managed`
  - Alcance equivalente para ámbito MDM.

- `Want to automate user scope?`
  - Enlace de ayuda para scope dinámico/automatizado.
  - Punto docente: tradeoff entre simplicidad inicial y escalabilidad.

## 2) Role (Admin -> User Administration -> Role -> Add/Edit Role)

### Matriz por módulo

Cada fila es un módulo operativo. Cada columna define nivel:

- `Full Control`: operación y administración completas del módulo.
- `Write`: ejecutar cambios operativos, sin todo el control administrativo.
- `Read`: consulta y visibilidad.
- `No Access`: módulo oculto/restringido.

### Lectura didáctica recomendada

- Rol responde a: **qué puede hacer**.
- Scope responde a: **sobre qué equipos puede hacerlo**.
- Regla de oro: para ejecutar una acción se necesita **rol + scope**.

## 3) Software Deployment (Templates -> Package -> Deployment)

### Templates

- Marketplace de recetas de despliegue.
- No es el despliegue en sí, es la base para crear package.

### Package

- Objeto operativo interno (instalador + metadatos + comportamiento).

### Actions

- `Install Software - Computer`: instalación a nivel equipo/sistema.
- `Install Software - User`: instalación ligada a contexto de usuario.

### Deployment policy

- Define cómo y cuándo ejecutar:
  - ventana
  - notificaciones
  - reintentos
  - comportamiento en fallos

### Target, Filter, Exclude

- `Target`: población base (domain/remote office/grupo).
- `Filter`: subconjunto al que sí aplicar.
- `Exclude`: excepciones explícitas.

### Execution status (lectura de estados)

- `Yet to Apply`: todavía no ejecutado en endpoint.
- `In Progress`: en ejecución.
- `Succeeded`: aplicado OK.
- `Failed`: revisar causa y remediación.

## 4) Security prompt (2FA)

- Aviso de hardening global de consola.
- No bloquear flujo principal del lab M1-M3; llevarlo a bloque de seguridad.
- Punto docente: seguridad por fases y priorización operativa.
