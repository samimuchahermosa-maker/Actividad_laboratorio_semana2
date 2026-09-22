---
titulo: "Estructura E: Framework CARE (Auditoría de Calidad CAD y Validación 3D)"
tipo: "prompt-framework"
framework: "CARE"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositiva 11"
tags:
  - framework-care
  - auditoria-cad
  - solidcheck
  - calidad-3d
  - watertight
---

# Estructura E: Framework CARE (Auditoría de Calidad y Validación 3D)

> [!IMPORTANT] Objetivo del Framework
> Enfocado en la **auditoría de calidad geométrica**, comprobación de estanqueidad (*watertight / manifold*) y verificación de interferencias físicas antes de la exportación a DWG y entrega académica final.

---

## 🧩 Desglose de Componentes CARE

| Componente | Definición en el Prompt |
| :--- | :--- |
| **C (Contexto)** | Finalización de un proyecto académico combinando extrusión de placas, revolución de ejes y barrido continuo en AutoCAD 3D. |
| **A (Acción)** | Diseñar una lista de chequeo (*checklist*) de auditoría CAD para validar la integridad geométrica de los modelos antes de entrega. |
| **R (Resultado)** | Protocolo paso a paso con comandos de comprobación nativos de AutoCAD (`SOLIDCHECK`, `INTERFERE`, `MASSPROP`, `CHECK`) y sus criterios de aceptación/rechazo. |
| **E (Ejemplo / Restricciones)** | Excluir dibujo 2D genérico (100% sólidos 3D). Especificar el valor o mensaje exacto que debe devolver la línea de comandos para ser aprobado. |

---

## 📝 Prompt para Copiar y Pegar

```text
[CONTEXTO]:
Estoy finalizando un proyecto académico de modelado 3D en AutoCAD donde se combinan piezas generadas por extrusión de placas, revolución de ejes y barrido de perfiles continuos.

[ACCIÓN]:
Diseña una lista de chequeo (checklist) de auditoría CAD para verificar la integridad geométrica de los modelos antes de exportarlos a DWG y presentarlos a revisión.

[RESULTADO ESPERADO]:
Un protocolo de control de calidad paso a paso que incluya los comandos de comprobación nativos de AutoCAD (como SOLIDCHECK, INTERFERE, MASSPROP, CHECK) y el criterio de aceptación/rechazo para cada uno.

[RESTRICCIONES]:
- No incluyas recomendaciones genéricas de dibujo 2D (enfócate estrictamente en sólidos 3D).
- Explica qué valor específico debe devolver cada comando para considerarse 'Aprobado sin errores'.
```

---

## 📋 Protocolo de Control de Calidad y Checklist (Salida Esperada)

### Matriz de Comprobación y Criterios de Aprobación

| Orden | Comando AutoCAD | Propósito de la Comprobación | Mensaje / Valor de Aprobación (Pasa) | Condición de Rechazo (Falla) |
| :---: | :--- | :--- | :--- | :--- |
| **1** | `_SOLIDCHECK` (Activar a `1`) | Validación continua de operaciones del modelador sólido ACIS. | Variable fijada en `1`. Al operar: *No emite alertas de colapso de cuerpo.* | Valor en `0` o advertencias de topología degenerada. |
| **2** | `_INTERFERE` | Comprobar colisiones o penetraciones indeseadas entre piezas del ensamble. | `Interfering pairs: 0` / *"No se encontraron interferencias entre los sólidos seleccionados."* | `Interfering pairs > 0` con resaltado rojo de volúmenes traslapados. |
| **3** | `_MASSPROP` | Comprobación de volumen y centro de gravedad para certificar solidez hermética. | `Volume: > 0.0000` (valor numérico positivo).<br>`Bounding box` congruente. | `Error: Not a 3D solid` o `Volume: 0.0000` (indica superficies vacías o mallas no sólidas). |
| **4** | `_CHECK` (dentro de `_SOLIDEDIT` $\rightarrow$ `_BODY` $\rightarrow$ `_CHECK`) | Auditoría de integridad de límites de caras, aristas y vértices del B-Rep. | `This object is a valid ShapeManager solid.` / *"Este objeto es un sólido ShapeManager válido."* | `This object is not a valid solid` o mensajes de aristas degeneradas. |

---

## 🔗 Enlaces Relacionados
- [[00_Indice_Prompts|← Volver al Índice General]]
- [[06_Prompt_Few_Shot_AutoLISP|← Estructura D (Few-Shot AutoLISP)]]
- [[01_Anatomia_Prompts_CAD|← Anatomía de Prompts CAD]]
