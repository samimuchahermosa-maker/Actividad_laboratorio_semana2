---
titulo: "El Meta-Prompt (Prompt Maestro para Diseño de Prompts CAD)"
tipo: "meta-prompt"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositiva 6"
tags:
  - meta-prompting
  - ingenieria-de-prompts
  - autocad-3d
---

# El Meta-Prompt (Prompt Maestro para Diseñar Prompts CAD)

> [!TIP] Propósito del Meta-Prompt
> Este prompt actúa como una plantilla generadora de segundo orden: instruye a una IA avanzada para que formule **prompts técnicos rigurosos** para resolución de piezas mecánicas en AutoCAD, Inventor o SolidWorks.

---

## 📋 Ficha Técnica

* **Rol Asignado:** Ingeniero de Prompts especialista en software de manufactura y CAD.
* **Objetivo:** Diseñar un prompt optimizado para modelado 3D mediante Extrusión (`_EXTRUDE`), Revolución (`_REVOLVE`) y Barrido (`_SWEEP`).
* **Criterios de Optimización:**
  1. Definición de rol técnico estricto.
  2. Detección preventiva de singularidades geométricas (tangencias deficientes, perfiles abiertos, auto-intersecciones).
  3. Justificación de selección de operación (p. ej. cilindros vs revolución).
  4. Formato estandarizado con comandos universales en inglés con guion bajo (`_`).
  5. Redacción en primera persona lista para copiar y pegar.

---

## 📝 Prompt para Copiar y Pegar

```text
Actúa como un Ingeniero de Prompts especialista en software de manufactura y CAD (AutoCAD, Inventor, SolidWorks).

Necesito que diseñes un prompt altamente optimizado para solicitarle a una IA la resolución de un problema de modelado 3D (específicamente operaciones de Extrusión, Revolución y Barrido con restricciones paramétricas 2D).

El prompt que diseñes debe:
1. Definir un rol técnico riguroso.
2. Exigir la identificación de singularidades geométricas críticas (tangencias, lazos abiertos, colisiones por radio de curvatura).
3. Obligar a la IA a justificar por qué una entidad debe revolucionarse en vez de extruirse.
4. Solicitar la salida estructurada en tablas de restricciones y secuencia de comandos en formato estándar AutoCAD (guion bajo para comandos universales: _EXTRUDE, _REVOLVE, _SWEEP).
5. Estar formulado en primera persona para ser copiado y pegado directamente.
```

---

## 🎯 Criterios de Evaluación del Prompt Resultante

Al ejecutar este meta-prompt, el resultado generado debe garantizar:
- Inclusión de directivas de validación 2D (`REGION`, `BOUNDARY`, `PEDIT`).
- Identificación de colapsos topológicos (*non-manifold edges*).
- Uso estricto de sintaxis de comandos con guion bajo para soportar cualquier versión de idioma de AutoCAD.

---

## 🔗 Enlaces Relacionados
- [[00_Indice_Prompts|← Volver al Índice General]]
- [[01_Anatomia_Prompts_CAD|← Anatomía de Prompts CAD]]
- [[03_Prompt_RTF_Modelado|Siguiente: Estructura A (RTF) →]]
