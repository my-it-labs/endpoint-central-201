# Laboratorio M5-02 — Script remoto

[← M5-01](01-tarea-programada.md) · [M5](README.md) · [Siguiente: M5-03 →](03-historico-y-ajuste.md)

Objetivo: desplegar un **script de bajo impacto** a `ec-client1` usando **Configurations** o **Tools**, con target y policy definidos.

---

### Paso 1 — Elegir el script (bajo impacto)

En lab **no** uses scripts destructivos. Ejemplos válidos:

| Script | Efecto |
|--------|--------|
| Crear archivo de prueba en `C:\Temp\ec-lab-marker.txt` | Evidencia de ejecución |
| `hostname` + fecha en un log | Inventario operativo ligero |
| Comprobar espacio en disco y escribir resultado | Dato útil sin cambiar sistema |

Usa el script de ejemplo siguiente (o uno equivalente de bajo impacto):

```powershell
$path = "C:\Temp\ec-lab-marker.txt"
New-Item -Path $path -ItemType File -Force | Out-Null
Set-Content -Path $path -Value ("EC-LAB " + (Get-Date -Format o))
```

---

### Paso 2 — Crear configuración de script

Ruta habitual:

```
Configurations → Add Configuration → Custom Script
```

(o **Software Deployment → Scripts** / **Tools → Run Script**, según versión).

**Referencia — custom script:**

![Custom script](../../capturas/M5/02-custom-script.png)

| Campo | Valor lab |
|-------|-----------|
| Nombre | `Lab-Marker-Script` |
| Tipo | PowerShell o Windows script |
| Ejecutar como | **System** (cuenta de equipo) |
| Contenido | Script del paso 1 |

---

### Paso 3 — Target y policy

Igual que M6 y M4:

| Campo | Valor |
|-------|--------|
| Target | **`ec-client1`** únicamente |
| Policy | Ejecución **inmediata** en lab (o ventana acordada) |
| Exclude | `ec-server` si aparece en selector |

Pulsa **Deploy** / **Associate to computers**.

**Comprueba:**

- Configuración creada sin error de validación.
- Solo un endpoint en alcance.

---

### Paso 4 — Validar ejecución

1. En consola: **Configurations → View Status** / **Execution status** del script.
2. En `ec-client1` (RDP o ventana VM): comprueba que existe `C:\Temp\ec-lab-marker.txt` (o el efecto acordado).

| Estado consola | Acción |
|----------------|--------|
| **Yet to Apply** | Esperar intervalo agente (como M6) |
| **Success** | Validar archivo en cliente |
| **Failed** | Ver mensaje; paso a M5-03 |

---

## Antes de seguir

Un script remoto usa la **misma cadena** que software y parches: objeto + target + policy + agente.

### Pon el foco en

- **Bajo impacto** en lab — en prod los scripts pasan por revisión de seguridad (quién, qué, rollback).
- Ejecutar como **System** vs **User** cambia permisos y rutas (paralelo a Install Computer/User en M6).
- Un script mal targeteado en **All Computers** es incidente de seguridad.

### Preguntas de cierre

1. ¿Por qué crear archivo en `C:\Temp` es más seguro que modificar registro en lab?
2. Si el script fuera «limpiar temp», ¿en qué ventana lo ejecutarías?
3. ¿Qué rol RBAC (M3) debería poder lanzar scripts? ¿Write en Configurations? ¿Admin?
4. Enumera **dos scripts** que automatizarías en tu empresa (y dos que nunca automatizarías sin CAB).

→ **[M5-03 — Histórico y ajuste](03-historico-y-ajuste.md)**
