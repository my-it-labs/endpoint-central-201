# Laboratorio M4-05 — Escalado y remediación

[← M4-04](04-despliegue-piloto.md) · [M4](README.md) · [Siguiente módulo: M5 →](../M5-automatizacion/README.md)

Objetivo: simular el **escalado** tras un piloto exitoso y practicar **remediación** cuando un endpoint queda en **Failed** o **Reboot Required**.

---

### Paso 1 — Revisar el piloto antes de escalar

Solo lectura en consola — no crees tareas ni grupos.

```
Threats & Patches → Deployment → Manual Deployment
```

Abre la tarea de piloto (suele llamarse **`Test-Cliente-01`** o **`Pilot-Deploy-Lab-01`**) y revisa estas pestañas:

| Pestaña | Qué mirar | Go (sigue al paso 2) | No-go (para aquí) |
|---------|-----------|----------------------|-------------------|
| **Summary** | **Current Status** | **Executed** | Ready / Suspended |
| **Summary** → Execution Summary | Gráfico de estados | **Succeeded** en todos los targets del grupo piloto | **Failed** o **Yet To Apply** sin explicación |
| **Summary** → Target Scope | **Apply To** | **Custom Group: Clientes** (o `Grupo-Clientes`) | **All Computers** o **Domain: WORKGROUP** |
| **Execution Status** | Fila por PC | **Succeeded** en `ec-client1` (y clientes del grupo) | **Failed** → paso 3 antes de escalar |

**Comprueba:** **Executed** + **Succeeded** + target = grupo piloto. Si hay **Failed**, no pases al paso 2.

---

### Paso 2 — Escalado progresivo (simulado)

En un parque real ampliarías el target por fases:

```
Fase 1: Grupo-Clientes          ← piloto (ya hecho)
Fase 2: Patch-Wave-02           ← oleada siguiente (este paso)
Fase 3: All Computers (excl. servidores críticos)
```

Aquí **sí actúas en consola**: primero el **grupo** de la oleada 2, luego la **tarea** de despliegue. En el lab con pocas VMs el objetivo es **planificar** el escalado; puedes guardar la tarea sin **Deploy Immediately** si los PCs ya están parcheados.

---

#### 2.1 — Crear el grupo `Patch-Wave-02`

Menú superior:

```
Admin
```

En la rejilla, pulsa **Custom Group** (bloque **Global Settings**).

```
Admin → Custom Group
```

1. Pestaña **Computer** (grupos de equipos — no **User**).
2. **+ Create New Group** (arriba a la izquierda).
3. Asistente **Create New Computer Group**:

| Campo | Valor lab |
|-------|-----------|
| **Group Name** | `Patch-Wave-02` |
| **Category** | **Static** (no Static Unique — puede solaparse con `Grupo-Clientes`) |
| **Membership** | **Assign manually** |
| **Select Computers** | Pestaña **List** → elige **`ec-client2`** en **Available Computers** → pásalo a **Added Computers** |

Si no tienes `ec-client2`, deja **Added Computers** vacío (grupo de planificación).

4. **Create Group**.

**Comprueba:** vuelves al listado **Custom Group → Computer** y aparece **`Patch-Wave-02`** con los miembros elegidos.

---

#### 2.2 — Crear la tarea `Wave-02-Deploy`

```
Threats & Patches → Deployment → Manual Deployment
```

Abre un **formulario nuevo** (no reutilices `Test-Cliente-01`).

| Bloque | Campo | Valor |
|--------|-------|--------|
| **Name** | Nombre de tarea | `Wave-02-Deploy` |
| **Install Patch** | **+ Add Patches** | Los mismos parches **Approved** del piloto (p. ej. **113640** WebView2) |
| **Deployment Settings** | **Deploy** | Marcado |
| | **Apply Deployment Policy** | La misma del piloto: *Deploy any time at the earliest*, **My Policy 2** o **Lab-Pilot-Deploy** |
| **Define Target** | **Target 1** | **Custom Group** → **`Patch-Wave-02`** |
| | **All Computers** | No |

Pie del formulario:

| Botón | Cuándo usarlo en el lab |
|-------|-------------------------|
| **Deploy** / **Deploy Immediately** | Si quieres ejecutar la oleada 2 de verdad |
| **Save As** | Si solo planificas (PCs ya en **Succeeded** en el piloto) |

**Comprueba:**

| Tarea | Target en Configuration Details |
|-------|--------------------------------|
| Piloto (`Test-Cliente-01`) | `Grupo-Clientes` / *Clientes* |
| Oleada 2 (`Wave-02-Deploy`) | **`Patch-Wave-02`** |

---

### Paso 3 — Remediación (si hay Failed)

Si el paso 1 salió **go**, este paso es de referencia — ejecútalo solo si ves **Failed** o **Reboot Required**.

```
Threats & Patches → Systems
```

Filtro **By Health** o columna de estado → localiza **Failed** / **Reboot Required**.

| Estado en consola | Acción en consola |
|-------------------|-------------------|
| **Failed** | Abre el PC → **Actions → Scan System**; revisa detalle del error en la tarea de despliegue |
| **Reboot Required** | **Actions → Reboot** (o espera ventana de la policy) |
| **Failed** tras reintento | **Patches → Decline Patches** (paso 4) o nueva tarea solo a ese PC |

**Comprueba:** has localizado la vista **Systems** con filtro de estado y la acción **Scan System** en un endpoint (aunque esté en **Healthy** en tu lab).

---

### Paso 4 — Pantalla Decline Patches

```
Threats & Patches → Patches → Decline Patches
```

Solo abre la pantalla y localiza la acción **Decline** — no hace falta declinar un parche en el lab si el piloto fue **Succeeded**.

**Comprueba:** ves el listado de parches declinables y el botón/acción **Decline** (o equivalente en tu versión).

→ **[M5 — Automatización operativa](../M5-automatizacion/README.md)**
