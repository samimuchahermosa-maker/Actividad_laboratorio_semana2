---
titulo: "Estructura C: Cadena de Pensamiento (Chain-of-Thought / CoT)"
tipo: "prompt-framework"
framework: "Chain-of-Thought"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositiva 9"
tags:
  - framework-cot
  - razonamiento-espacial
  - deduccion-geometrica
  - operaciones-3d
---

# Estructura C: Cadena de Pensamiento (Chain-of-Thought / CoT)

> [!TIP] Objetivo del Framework
> Obligar a la IA a **razonar en voz alta paso a paso**, deduciendo la lógica espacial y geométrica antes de formular conclusiones o secuencias de modelado. Es el estándar para validar la solidez del razonamiento del modelo.

---

## 🧩 Metodología de Razonamiento Guiado

La formulación divide el problema en tres grupos de entidades clave:
1. **Grupo 1 (Laminar/Leva):** Perfiles cerrados con arcos complejos ($R15$, $R60$, $R130$) y taladros pasantes.
2. **Grupo 2 (Ejes/Pasadores):** Ejes concéntricos escalonados ($\varnothing 6$ mm y $\varnothing 15$ mm).
3. **Grupo 3 (Directriz/Barrido):** Trayectoria 2D de longitud $\le 28$ mm con curvas en U y sección circular ($\varnothing 0.8$ mm).

---

## 📝 Prompt para Copiar y Pegar

```text
Eres un instructor certificado de Autodesk AutoCAD.

Quiero que analices el siguiente problema de modelado 3D razonando paso a paso:

Tenemos tres grupos de geometrías en un boceto 2D:
- Grupo 1: Perfiles laminares cerrados con curvas de radios R15, R60, R130 y taladros pasantes.
- Grupo 2: Ejes escalonados concéntricos de diámetros D6 y D15.
- Grupo 3: Una directriz 2D continua de 28 mm de largo máximo con curvas en U y una sección circular de diámetro 0.8 mm.

Por favor, sigue este razonamiento en orden:
Paso 1: Evalúa la topología del Grupo 1 y deduce por qué una polilínea abierta fallaría al extruir. Explica la solución con REGION o BOUNDARY.
Paso 2: Compara dos métodos para el Grupo 2: (A) Cilindros extruidos y unidos por _UNION, frente a (B) Semiperfil revolucionado por _REVOLVE 360°. Deduce cuál genera menos errores de caras solapadas.
Paso 3: Analiza el Grupo 3 y verifica la condición de no auto-intersección para el barrido (_SWEEP).
Paso 4: A partir de los pasos anteriores, sintetiza el árbol de operaciones definitivo desde el boceto hasta el sólido final.
```

---

## 🧠 Deducción Lógica Paso a Paso (Razonamiento del Modelo)

### Paso 1: Topología de Perfiles Laminares y Taladros
- **Falla de polilíneas abiertas:** Si un contorno no está cerrado topológicamente (`Closed = Yes`), `_EXTRUDE` generará una superficie hueca sin masa (*surface*) en lugar de un sólido 3D (*3D Solid*). Además, no permitirá sustracciones booleanas (`_SUBTRACT`) de los taladros.
- **Solución:** Crear regiones cerradas mediante `_REGION` para el contorno exterior y los círculos interiores, y sustraerlos en 2D, o utilizar `_BOUNDARY` para detectar islas cerradas automáticamente.

### Paso 2: Comparativa de Métodos para Ejes Escalonados
- **Método A (Cilindros + `_UNION`):** Requiere colocar dos cilindros (`_CYLINDER`) con centros en coordenadas idénticas y unirlos. Si las bases no coinciden con precisión numérica infinitesimal de coma flotante, se generan aristas colineales o errores de caras coplanares (*non-manifold*).
- **Método B (Semiperfil + `_REVOLVE 360°`):** Se dibuja el semiperfil cerrado con el contorno escalonado y se revoluciona sobre el eje de simetría en una única operación atómica.
- **Conclusión:** El **Método B** es computacionalmente más limpio, produce un sólido B-Rep continuo y elimina por completo el riesgo de errores de caras solapadas.

### Paso 3: Condición de Barrido sin Auto-Intersección
- Diámetro del alambre $d = 0.8 \text{ mm} \implies \text{Radio de sección } r = 0.4 \text{ mm}$.
- **Condición crítica de curvatura:** El radio interior mínimo de curvatura en cualquier codo en U de la directriz debe cumplir:
  $$R_{\text{curvatura interior}} \ge r_{\text{sección}} = 0.4\text{ mm}$$
- Si el radio de giro es menor a $0.4\text{ mm}$, el material interior de la curva colisionará consigo mismo produciendo el colapso del kernel ACIS con el error `Self-intersection along sweep path`.

### Paso 4: Árbol de Operaciones Definitivo
1. **Modelado Base:** Extrusión del perfil de la leva con taladros ya sustraídos (`_REGION` $\rightarrow$ `_SUBTRACT` $\rightarrow$ `_EXTRUDE`).
2. **Modelado de Pasador:** Revolución del semiperfil sobre el eje axial (`_REVOLVE` $360^\circ$).
3. **Modelado de Alambre/Resorte:** Generación de la directriz suavizada (`_PLINE` con arcos $\ge 0.5\text{ mm}$) y barrido del círculo (`_SWEEP`).
4. **Ensamblaje:** Posicionamiento espacial relativo mediante punto base de referencia y validación final.

---

## 🔗 Enlaces Relacionados
- [[00_Indice_Prompts|← Volver al Índice General]]
- [[04_Prompt_CRISPE_Topologia|← Estructura B (CRISPE)]]
- [[06_Prompt_Few_Shot_AutoLISP|Siguiente: Estructura D (Few-Shot AutoLISP) →]]
