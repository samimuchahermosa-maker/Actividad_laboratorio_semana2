# Actividad_laboratorio_semana2

**Grupo 2**
- Abigail
- Santiesteban reaño Piero Alessandro
- Katty
- Marfrancis
- Mucha Hermosa Sami Paolo

---

## 📖 Descripción del Proyecto

Proyecto de integración entre Inteligencia Artificial y AutoCAD mediante el protocolo **MCP (Model Context Protocol)**, ingeniería de prompts técnicos para modelado 3D (Extrusión, Revolución, Barrido) y automatización mediante scripts en **AutoLISP**.

---

## 🗂️ Estructura del Repositorio y Vault de Obsidian

Para mantener la contextualización y una gestión eficiente de los archivos, el vault de Obsidian se aloja directamente dentro del directorio raíz del proyecto:

```
/Actividad_laboratorio_semana2
│
├── /docs_obsidian                          # Vault de Obsidian (Gestión de conocimiento)
│   ├── /01_Investigacion                   # Notas sobre MCP, comparativa IA y referencias IEEE
│   │   ├── 01_MCP_AutoCAD_Arquitectura.md
│   │   ├── 02_Comparativa_Modelos_IA.md
│   │   └── 03_Referencias_IEEE.md
│   │
│   ├── /02_Prompts                         # Banco de prompts técnicos y frameworks
│   │   ├── 00_Indice_Prompts.md            # Índice maestro (MOC)
│   │   ├── 01_Anatomia_Prompts_CAD.md      # Anatomía de construcción de prompts
│   │   ├── 02_Meta_Prompt.md               # El prompt maestro para diseñar prompts CAD
│   │   ├── 03_Prompt_RTF_Modelado.md       # Framework RTF (Rol - Tarea - Formato)
│   │   ├── 04_Prompt_CRISPE_Topologia.md   # Framework CRISPE (Topología y errores)
│   │   ├── 05_Prompt_Chain_of_Thought_Razonamiento.md  # Cadena de pensamiento (CoT)
│   │   ├── 06_Prompt_Few_Shot_AutoLISP.md  # Framework Few-Shot (AutoLISP)
│   │   └── 07_Prompt_CARE_Auditoria_Calidad.md         # Framework CARE (Auditoría de calidad)
│   │
│   └── /03_Configuracion                   # Guías de despliegue y conexión
│       └── 01_Guia_Configuracion_MCP.md
│
├── /src                                    # Scripts ejecutables en AutoCAD
│   └── generar_geometrias_3d.lsp           # Rutinas AutoLISP automatizadas
│
├── /cad_files                              # Archivos .dwg (Bocetos 2D y modelos 3D)
│
├── Actividad_laboratorio_semana2.pptx      # Presentación original de la actividad
└── README.md                               # Documentación principal del repositorio
```

---

## 🚀 Cómo Usar el Vault de Obsidian

1. Abre **Obsidian**.
2. Selecciona **Open folder as vault** (Abrir carpeta como vault).
3. Selecciona la carpeta [`docs_obsidian`](file:///C:/Users/sami%20paolo/Downloads/Proyectos/Actividad_laboratorio_semana2/docs_obsidian).
4. Abre la nota principal [`00_Indice_Prompts.md`](file:///C:/Users/sami%20paolo/Downloads/Proyectos/Actividad_laboratorio_semana2/docs_obsidian/02_Prompts/00_Indice_Prompts.md) para navegar por los prompts y frameworks mediante los enlaces internos `[[...]]`.

---

## 💻 Ejecución de Rutinas AutoLISP en AutoCAD

1. En AutoCAD, ejecuta el comando `APPLOAD`.
2. Carga el archivo [`src/generar_geometrias_3d.lsp`](file:///C:/Users/sami%20paolo/Downloads/Proyectos/Actividad_laboratorio_semana2/src/generar_geometrias_3d.lsp).
3. Utiliza los siguientes comandos universales:
   - `CrearCilindroBase`
   - `CrearPrismaPentagonal`
   - `CrearPasadorRevolucion`
   - `CrearBarridoAlambre`
