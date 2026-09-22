---
titulo: "Análisis Comparativo de Modelos de IA: Gratuita vs. De Paga"
tipo: "investigacion"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositivas 13 y 14"
tags:
  - inteligencia-artificial
  - artificial-analysis
  - evaluacion-llm
  - benchmarks
---

# Análisis Comparativo de Modelos de IA: Gratuita vs. De Paga

Para fundamentar la selección del modelo de inteligencia artificial óptimo en tareas de asistencia CAD y generación de scripts, se emplean los datos y métricas estandarizadas de **Artificial Analysis**.

---

## 📊 Métricas de Evaluación (Artificial Analysis)

La evaluación compara tres dimensiones críticas:
1. **Inteligencia:** Medida por el *Artificial Analysis Intelligence Index*, una suite integral que sintetiza y compara capacidades en:
   - Razonamiento deductivo y lógico.
   - Comprensión de conocimiento técnico especializado.
   - Habilidades matemáticas y espaciales.
   - Programación y generación de código (AutoLISP, Python).
   - Combina diez pruebas basadas en texto y aplicabilidad práctica (intervalo de confianza estimado $< 1\%$).
2. **Velocidad de Respuesta:** Medida en tokens por segundo ($TPS$) y latencia hasta el primer token ($TTFT$).
3. **Costo por Token:** Comparativa de costo de entrada/salida (USD por millón de tokens) frente a modelos de libre acceso (Open Source / Free tier).

---

## ⚖️ Criterios de Selección para Modelado CAD y AutoLISP

| Requisito del Proyecto CAD | Modelo Recomendado | Justificación Técnica |
| :--- | :--- | :--- |
| **Razonamiento espacial y deducción de operaciones 3D** | Modelos Frontier (Claude 3.5/3.7 Sonnet, GPT-4o, Gemini 1.5/2.0 Pro) | Requiere alta fidelidad en relaciones geométricas, evitando auto-intersección en barridos y deduciendo árboles booleanos. |
| **Generación de scripts AutoLISP / Python COM** | Modelos con alto índice de código (Claude 3.5 Sonnet, DeepSeek V3/R1) | Mayor rigor sintáctico en LISP (paréntesis, nombres universales con guion bajo `_.`). |
| **Despliegue local y privacidad de archivos DWG** | Modelos Open-Weight (Llama 3.3 70B, DeepSeek R1 Distill) | Permiten inferencia *on-premise* sin enviar propiedad intelectual a la nube. |

---

## 🔗 Enlaces Relacionados
- [[01_MCP_AutoCAD_Arquitectura|← Investigación MCP]]
- [[03_Referencias_IEEE|Siguiente: Referencias IEEE →]]
- [[../02_Prompts/00_Indice_Prompts|Ver Banco de Prompts →]]
