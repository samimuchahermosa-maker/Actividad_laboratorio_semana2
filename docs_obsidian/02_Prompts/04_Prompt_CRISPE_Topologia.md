---
titulo: "Estructura B: Framework CRISPE (Topología y Errores Geométricos)"
tipo: "prompt-framework"
framework: "CRISPE"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositiva 8"
tags:
  - framework-crispe
  - topologia-cad
  - non-manifold
  - self-intersection
  - sweep
---

# Estructura B: Framework CRISPE (Topología y Diagnóstico de Errores)

> [!WARNING] Objetivo del Framework
> Resolver problemas complejos de tangencias, curvaturas críticas y prevenir fallas de **auto-intersección (*Self-intersection*)** y aristas no-múltiples (*non-manifold*) antes de generar la geometría 3D.

---

## 🧩 Desglose de Componentes CRISPE

| Componente | Definición en el Prompt |
| :--- | :--- |
| **C & R (Capacity & Role)** | Capacidad de un Ingeniero Mecánico especialista en modelado paramétrico y análisis geométrico en AutoCAD. |
| **I (Insight)** | Ensamble compuesto por leva plana, seguidor con arcos enlazados, pasadores cilíndricos escalonados y alambre en espiras continuas. |
| **S (Statement)** | Analizar fallas topológicas 2D pre-3D: radios mínimos de curvatura en barrido (`_SWEEP`) y arcos con tangencia estricta para evitar geometrías *non-manifold*. |
| **P (Personality)** | Analítica, crítica y rigurosamente apegada a normas de dibujo técnico industrial (ISO/ASME). |
| **E (Experiment)** | Matriz de diagnóstico: *Causa geométrica en 2D* \| *Error arrojado por AutoCAD* \| *Solución preventiva en el árbol de operaciones*. |

---

## 📝 Prompt para Copiar y Pegar

```text
Capacidad y Rol:
Tienes la capacidad de un Ingeniero Mecánico especialista en modelado de sólidos paramétricos y análisis geométrico en AutoCAD.

Insight (Contexto):
Estoy desarrollando un ensamble en AutoCAD compuesto por una leva plana, un brazo seguidor oscilante con múltiples arcos enlazados, pasadores cilíndricos escalonados y un alambre conformado en espiras curvas continuas.

Declaración (Instrucción):
Analiza las posibles fallas topológicas del modelo 2D antes de pasar a 3D. Dime con exactitud qué radios mínimos de curvatura deben respetarse en la trayectoria de barrido para no provocar el colapso del comando _SWEEP, y qué arcos requieren restricción de tangencia estricta para que la extrusión no genere aristas no-múltiples (non-manifold).

Personalidad:
Analítica, crítica y orientada a las normas de dibujo técnico industrial (ISO/ASME).

Experimento (Salida requerida):
Entrega una matriz de diagnóstico de errores potenciales, indicando: Causa geométrica en el boceto 2D | Error arrojado por AutoCAD | Solución preventiva en el árbol de operaciones.
```

---

## 🔬 Matriz de Diagnóstico Geométrica (Salida Esperada)

| Causa Geométrica en 2D | Error Arrojado por AutoCAD | Solución Preventiva en el Árbol de Operaciones |
| :--- | :--- | :--- |
| **Radio de curvatura menor al radio de la sección ($R_{trayectoria} < r_{perfil}$)** en barrido. | `Modeling Operation Error: Self-intersection of swept entity` / `Cannot sweep along path`. | Modificar la directriz 2D asegurando $R_{curvatura} \ge 1.05 \times r_{sección}$ o reducir el radio de la sección circular antes de ejecutar `_SWEEP`. |
| **Falta de tangencia ($G^0$ en vez de $G^1$)** entre arcos consecutivos en perfiles extruidos. | Aristas vivas disconexas o errores al aplicar empalmes: `Cannot fillet edge: non-manifold topology`. | Aplicar restricción geométrica de tangencia (`_GEOMCONSTRAINT _TANGENT`) entre centros y puntos de inflexión de los arcos en el boceto 2D. |
| **Contorno con micro-aberturas** o líneas superpuestas duplicadas. | `Curves do not form a closed loop` / `Extrusion produces surface, not solid`. | Utilizar `_OVERKILL` para eliminar duplicados y convertir a región cerrada hermética con `_REGION` o `_BOUNDARY` antes de `_EXTRUDE`. |
| **Caras coplanares coincidentes** al intentar unir sólidos con `_UNION`. | `Inconsistent face-edge intersection` / `Boolean operation failed`. | Traslapar intencionalmente las entidades o modelar la pieza como un único semiperfil revolucionado mediante `_REVOLVE`. |

---

## 🔗 Enlaces Relacionados
- [[00_Indice_Prompts|← Volver al Índice General]]
- [[03_Prompt_RTF_Modelado|← Estructura A (RTF)]]
- [[05_Prompt_Chain_of_Thought_Razonamiento|Siguiente: Estructura C (Chain-of-Thought) →]]
