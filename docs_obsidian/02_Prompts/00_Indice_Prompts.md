---
titulo: "Índice del Banco de Prompts - Modelado y Automatización CAD"
proyecto: "Actividad_laboratorio_semana2"
grupo: "Grupo 2"
integrantes:
  - "Abigail"
  - "Santiesteban reaño Piero Alessandro"
  - "Katty"
  - "Marfrancis"
  - "Mucha Hermosa Sami Paolo"
tags:
  - autocad
  - prompt-engineering
  - mcp
  - obsidian-vault
  - moc
---

# Banco de Prompts - Integración IA y AutoCAD 3D

Este directorio forma parte del **Vault de Obsidian** del proyecto `Actividad_laboratorio_semana2`. Contiene el repositorio estructurado de prompts de ingeniería aplicados a tareas de modelado 3D (Extrusión, Revolución, Barrido), validación topológica, automatización vía scripts (AutoLISP/Python) y auditoría geométrica.

---

## 📐 1. Fundamentos y Meta-Prompting

- [[01_Anatomia_Prompts_CAD]]: Anatomía de construcción de prompts técnicos (Rol, Contexto, Tarea, Restricciones y Formato de Salida).
- [[02_Meta_Prompt]]: El prompt maestro diseñado para generar nuevos prompts optimizados para ingeniería CAD.

---

## 🛠️ 2. Banco de Prompts por Frameworks

| Nota | Framework | Objetivo Principal | Nivel de Detalle |
| :--- | :--- | :--- | :--- |
| [[03_Prompt_RTF_Modelado]] | **RTF** (Rol - Tarea - Formato) | Secuencia rápida y directa para modelar sólidos 3D minimizando booleanas. | Directo / Operativo |
| [[04_Prompt_CRISPE_Topologia]] | **CRISPE** (Capacidad - Rol - Insight - Declaración - Personalidad - Experimento) | Análisis preventivo de fallas topológicas, tangencias y no auto-intersección en barridos. | Analítico / Diagnóstico |
| [[05_Prompt_Chain_of_Thought_Razonamiento]] | **Chain-of-Thought (CoT)** | Razonamiento deductivo paso a paso para comparar métodos y sintetizar árbol de operaciones. | Razonamiento profundo |
| [[06_Prompt_Few_Shot_AutoLISP]] | **Few-Shot Learning** | Generación de scripts en AutoLISP listos para ejecución en consola o servidor MCP. | Programación CAD |
| [[07_Prompt_CARE_Auditoria_Calidad]] | **CARE** (Contexto - Acción - Resultado - Ejemplo/Restricción) | Protocolo y checklist de control de calidad para sólidos herméticos (*watertight*). | Auditoría y QA |

---

## 💡 Guía de Uso en Obsidian

1. Puedes navegar directamente entre las notas haciendo clic en los enlaces internos `[[Nombre_De_Nota]]`.
2. Cada archivo incluye un bloque de texto formateado con sintaxis lista para ser copiada y pegada en el asistente de IA seleccionado (Claude, ChatGPT, DeepSeek, Gemini).
3. Los comandos universales de AutoCAD se mantienen con guion bajo prefijado (`_EXTRUDE`, `_REVOLVE`, `_SWEEP`, etc.) para asegurar compatibilidad universal idiomática.
