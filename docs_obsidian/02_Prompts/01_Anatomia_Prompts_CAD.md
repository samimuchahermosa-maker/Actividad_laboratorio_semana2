---
titulo: "Anatomía de Construcción de Prompts CAD"
tipo: "fundamento"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositiva 5"
tags:
  - prompt-engineering
  - metodologia
  - cad-paramétrico
---

# Anatomía de Construcción de Prompts Técnicos en CAD

Para garantizar que los modelos de lenguaje (LLMs) generen secuencias de diseño precisas, código ejecutable y análisis topológicos válidos en entornos como **AutoCAD 2027**, se adopta una arquitectura de cinco capas fundamentales:

```
┌────────────────────────────────────────────────────────┐
│ 1. Rol / Persona (Role)                                │
│    ↳ Asigna el perfil técnico y marco de conocimiento  │
├────────────────────────────────────────────────────────┤
│ 2. Contexto de Entrada (Context)                       │
│    ↳ Define software, versiones, unidades y piezas     │
├────────────────────────────────────────────────────────┤
│ 3. Instrucción / Tarea (Task)                          │
│    ↳ Verbo de acción directo, sin ambigüedades         │
├────────────────────────────────────────────────────────┤
│ 4. Restricciones y Reglas Negativas (Constraints)      │
│    ↳ Delimita qué prácticas evitar estrictamente       │
├────────────────────────────────────────────────────────┤
│ 5. Formato de Salida (Output Format)                   │
│    ↳ Estructura la respuesta: tablas, código, listas   │
└────────────────────────────────────────────────────────┘
```

---

## Componentes de la Anatomía

### 1. Rol / Persona (Role)
* **Propósito:** Sitúa al modelo en el rol de un especialista en diseño mecánico y CAD paramétrico.
* **Ejemplo:** `"Actúa como un Diseñador Senior en AutoCAD 3D y especialista en manufactura mecánica..."`

### 2. Contexto de Entrada (Context)
* **Propósito:** Define las variables de entorno de trabajo: software objetivo (**AutoCAD 2027**), sistema de unidades (**milímetros**), y el tipo de geometría a resolver (extrusión, revolución, barrido).
* **Ejemplo:** `"Estamos trabajando en AutoCAD 2027 con unidades en milímetros sobre un boceto 2D compuesto por perfiles cerrados y trayectorias curvas."`

### 3. Instrucción / Tarea (Task)
* **Propósito:** Emplea verbos de acción directos e inequívocos (analizar, optimizar, estructurar, deducir, generar).
* **Ejemplo:** `"Determina la secuencia óptima para generar los sólidos 3D minimizando el número de operaciones booleanas posteriores."`

### 4. Restricciones y Reglas Negativas (Constraints)
* **Propósito:** Previene alucinaciones y malas prácticas de modelado 3D:
  - *No omitir cotas críticas.*
  - *Priorizar revolución (`_REVOLVE`) sobre unión de cilindros extruidos.*
  - *No aplicar redondeos (`_FILLETEDGE`) antes de consolidar las operaciones booleanas.*
  - *Asegurar que las polilíneas de barrido cumplan $R_{curvatura} > r_{sección}$ para evitar auto-intersección.*

### 5. Formato de Salida (Output Format)
* **Propósito:** Exige entregables reproducibles: tablas técnicas, árboles de operaciones jerárquicos o bloques de código AutoLISP universales (usando guion bajo `_`).
* **Ejemplo:** `"Presenta la respuesta en: 1. Tabla de clasificación geométrica, 2. Lista de restricciones 2D, 3. Secuencia de comandos en inglés y español."`

---

## 🔗 Enlaces Relacionados
- [[00_Indice_Prompts|← Volver al Índice General]]
- [[02_Meta_Prompt|Siguiente: El Meta-Prompt →]]
