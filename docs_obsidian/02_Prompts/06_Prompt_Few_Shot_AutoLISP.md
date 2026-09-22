---
titulo: "Estructura D: Framework Few-Shot (Automatización AutoLISP / MCP)"
tipo: "prompt-framework"
framework: "Few-Shot"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositiva 10"
tags:
  - framework-few-shot
  - autolisp
  - mcp-tools
  - scripting-cad
  - automatizacion
---

# Estructura D: Framework Few-Shot (AutoLISP / MCP Automation)

> [!NOTE] Objetivo del Framework
> Proporcionar ejemplos guiados (Input $\rightarrow$ Output) para obligar a la IA a generar **código AutoLISP sintácticamente válido y compatible** con la consola nativa de AutoCAD o con llamadas de ejecución de herramientas mediante servidores **MCP (Model Context Protocol)**.

---

## 🧩 Características Técnicas del Código Generado

1. **Sintaxis Universal con Guion Bajo (`_.` / `_`):**
   - El punto y guion bajo `_.` garantiza que AutoCAD interprete el comando en inglés estándar, ignorando el idioma instalado del sistema (español, alemán, francés, etc.) y sin verse afectado por redefiniciones de comandos.
2. **Creación y Asignación Automática de Capas:**
   - Uso de `_.layer _M <nombre>` (Make layer) para crear y activar la capa en una sola instrucción.
3. **Manejo Seguro de Coordenadas:**
   - Listas de puntos LISP explícitas: `'(x y z)`.

---

## 📝 Prompt para Copiar y Pegar

```text
Actúa como un programador de scripts de automatización CAD (AutoLISP / Python COM para AutoCAD).

Te proporcionaré una descripción geométrica y tú debes generar el bloque de comandos en AutoLISP con sintaxis universal protegida (con guion bajo para compatibilidad idiomática).

### Ejemplo de Entrada:
Entidad: Cilindro base en (500,50,0), radio 35, altura 110. Capa: 06_CILINDRO.

### Ejemplo de Salida:
```lisp
(command "_.layer" "_M" "06_CILINDRO" "_C" "6" "" "")
(command "_.cylinder" '(500 50 0) 35.0 110.0)
```

### Tu turno:
Genera el código para:
1. Un prisma pentagonal regular inscrito con centro en (0,0,0), radio circunscrito de 68.052 mm y extrusión de 60 mm en la capa 01_PRISMA.
2. Un semiperfil rectangular de pasador girado 360 grados sobre el eje Y en la capa 02_PASADOR.
3. Un barrido de un círculo de radio 0.4 mm sobre una polilínea 'clip_path' en la capa 03_BARRIDO.
```

---

## 💻 Código AutoLISP Resultante (Salida Esperada)

```lisp
;;; ==========================================================================
;;; TAREA 1: Prisma Pentagonal Regular Inscrito y Extruido
;;; ==========================================================================
(defun c:CrearPrismaPentagonal ()
  (command "_.layer" "_M" "01_PRISMA" "_C" "1" "" "")
  ;; Polígono de 5 lados inscrito con centro en (0,0,0) y radio 68.052
  (command "_.polygon" 5 '(0 0 0) "_I" 68.052)
  ;; Extrusión del polígono generado a 60 mm
  (command "_.extrude" "_L" "" 60.0)
  (princ "\n[OK] Prisma pentagonal generado en capa 01_PRISMA.")
  (princ)
)

;;; ==========================================================================
;;; TAREA 2: Semiperfil de Pasador Revolucionado 360° sobre el Eje Y
;;; ==========================================================================
(defun c:CrearPasadorRevolucion ()
  (command "_.layer" "_M" "02_PASADOR" "_C" "2" "" "")
  ;; Se dibuja el semiperfil rectangular cerrado (ej. radio 7.5 mm, largo 40 mm)
  (command "_.pline" '(0 0 0) '(7.5 0 0) '(7.5 40 0) '(0 40 0) "_C")
  ;; Revolución sobre el eje Y (de (0,0,0) a (0,40,0)) en 360 grados
  (command "_.revolve" "_L" "" '(0 0 0) '(0 40 0) 360.0)
  (princ "\n[OK] Pasador por revolución generado en capa 02_PASADOR.")
  (princ)
)

;;; ==========================================================================
;;; TAREA 3: Barrido de Círculo R=0.4 mm sobre la Trayectoria 'clip_path'
;;; ==========================================================================
(defun c:CrearBarridoAlambre ( / ssPath ptStart)
  (command "_.layer" "_M" "03_BARRIDO" "_C" "3" "" "")
  ;; Seleccionar polilínea previa o creada en la capa
  (setq ssPath (ssget "_X" '((0 . "*POLYLINE") (8 . "03_BARRIDO"))))
  (if ssPath
    (progn
      (setq ptStart (vlax-curve-getStartPoint (ssname ssPath 0)))
      ;; Dibujar círculo de sección transversal de radio 0.4 mm
      (command "_.circle" ptStart 0.4)
      ;; Ejecutar barrido sobre la directriz
      (command "_.sweep" "_L" "" ssPath)
      (princ "\n[OK] Barrido completado con radio 0.4 mm.")
    )
    (princ "\n[AVISO] No se encontró la trayectoria en capa 03_BARRIDO.")
  )
  (princ)
)
```

---

## 🔗 Enlaces Relacionados
- [[00_Indice_Prompts|← Volver al Índice General]]
- [[05_Prompt_Chain_of_Thought_Razonamiento|← Estructura C (Chain-of-Thought)]]
- [[07_Prompt_CARE_Auditoria_Calidad|Siguiente: Estructura E (CARE Auditoría) →]]
