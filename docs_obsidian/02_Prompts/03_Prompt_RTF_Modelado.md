---
titulo: "Estructura A: Framework RTF (Rol - Tarea - Formato)"
tipo: "prompt-framework"
framework: "RTF"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositiva 7"
tags:
  - framework-rtf
  - modelado-3d
  - extrude
  - revolve
  - sweep
---

# Estructura A: Framework RTF (Rol - Tarea - Formato)

> [!NOTE] Objetivo del Framework
> Obtener una secuencia rápida, estandarizada y directa para modelar el sólido 3D sin explicaciones teóricas redundantes.

---

## 🧩 Desglose de Componentes

| Sección | Elemento | Definición en el Prompt |
| :--- | :--- | :--- |
| **R** | **Rol** | Diseñador Senior en AutoCAD 3D y experto en manufactura mecánica. |
| **T** | **Tarea** | Analizar boceto 2D, clasificar entidades y determinar la secuencia óptima empleando únicamente `_EXTRUDE`, `_REVOLVE` y `_SWEEP`, minimizando booleanas. |
| **F** | **Formato** | 1. Tabla comparativa técnica.<br>2. Lista de restricciones 2D paramétricas.<br>3. Flujo paso a paso con comandos bilingües. |

---

## 📝 Prompt para Copiar y Pegar

```text
[ROL]:
Actúa como un Diseñador Senior en AutoCAD 3D y experto en manufactura mecánica.

[TAREA]:
Analiza el boceto 2D adjunto compuesto por perfiles cerrados, ejes de simetría y trayectorias curvas. Determina la secuencia óptima para generar los sólidos 3D utilizando exclusivamente las operaciones de EXTRUSIÓN (_EXTRUDE), REVOLUCIÓN (_REVOLVE) y BARRIDO (_SWEEP), minimizando el número de operaciones booleanas posteriores.

[FORMATO DE SALIDA]:
1. Tabla de clasificación: Entidad | Operación 3D asignada | Justificación técnica.
2. Lista de restricciones 2D obligatorias (tangencia, coincidencia, concentricidad).
3. Flujo paso a paso con los nombres exactos de los comandos de AutoCAD en español e inglés.
```

---

## 📊 Ejemplo de Respuesta Esperada de la IA

### 1. Tabla de Clasificación Geométrica

| Entidad | Operación 3D Asignada | Justificación Técnica |
| :--- | :--- | :--- |
| Placa base / Leva | Extrusión (`_EXTRUDE`) | Perfil laminar prismático con espesor uniforme y taladros pasantes perpendiculares. |
| Ejes escalonados / Pasadores | Revolución (`_REVOLVE`) | Geometría axialmente simétrica; una sola operación sustituye múltiples uniones booleanas de cilindros concéntricos. |
| Resorte / Alambre guía | Barrido (`_SWEEP`) | Perfil circular constante a lo largo de una directriz curva no planar o curva 2D continua. |

### 2. Restricciones 2D Obligatorias
- **Tangencia (`_GEOMCONSTRAINT _TANGENT`):** Entre arcos de enlace de la leva para evitar quiebres y aristas vivas.
- **Concentricidad (`_GEOMCONSTRAINT _CONCENTRIC`):** Entre taladros y radios exteriores.
- **Coincidencia (`_GEOMCONSTRAINT _COINCIDENT`):** En extremos de polilíneas para garantizar contornos cerrados herméticos.

### 3. Secuencia de Comandos (Español / Inglés)
1. `REGION` / `_REGION` o `CONTORNO` / `_BOUNDARY` para generar regiones cerradas.
2. `EXTRUSION` / `_EXTRUDE` para sólidos laminares.
3. `REVOLUCION` / `_REVOLVE` para sólidos de revolución (360°).
4. `BARRIDO` / `_SWEEP` para geometrías tubulares o de trayectoria.
5. `UNION` / `_UNION` y `DIFERENCIA` / `_SUBTRACT` según el árbol de operaciones final.

---

## 🔗 Enlaces Relacionados
- [[00_Indice_Prompts|← Volver al Índice General]]
- [[02_Meta_Prompt|← El Meta-Prompt]]
- [[04_Prompt_CRISPE_Topologia|Siguiente: Estructura B (CRISPE) →]]
