---
titulo: "Investigación sobre el Model Context Protocol (MCP) y AutoCAD"
tipo: "investigacion"
proyecto: "Actividad_laboratorio_semana2"
fuente: "Presentación - Diapositivas 2, 3 y 4"
tags:
  - mcp
  - autocad
  - json-rpc
  - api-com
  - pywin32
---

# Investigación sobre el MCP (Model Context Protocol) y su Integración con AutoCAD

## 1. ¿Qué es el MCP?
El **Model Context Protocol (MCP)** es un estándar y protocolo abierto cliente-servidor que permite a los asistentes de inteligencia artificial conectarse de forma estandarizada y segura con herramientas, bases de datos, APIs y aplicaciones locales de escritorio.

## 2. Origen y Desarrollo
* **Creador:** Desarrollado y publicado por **Anthropic** a finales de 2024 como proyecto *open-source*.
* **Protocolo de Transporte:** Utiliza especificación **JSON-RPC 2.0**.
* **Canales de Comunicación:**
  - `stdio` (I/O estándar): Para ejecución y comunicación entre procesos dentro de la misma máquina host local.
  - `SSE` / `HTTP`: Para arquitecturas cliente-servidor distribuidas y remotas.

---

## 3. Primitivas Principales de la Arquitectura MCP

```
┌─────────────────────────────────────────────────────────────┐
│                       Servidor MCP                          │
│                                                             │
│   ┌────────────────┐   ┌────────────────┐   ┌───────────┐   │
│   │  Herramientas  │   │    Recursos    │   │  Prompts  │   │
│   │    (Tools)     │   │   (Resources)  │   │           │   │
│   └────────────────┘   └────────────────┘   └───────────┘   │
└─────────────────────────────────────────────────────────────┘
                               ▲
                       JSON-RPC 2.0 (stdio)
                               ▼
┌─────────────────────────────────────────────────────────────┐
│                 Asistente de IA (Cliente)                   │
│               (Claude, ChatGPT, Gemini, etc.)               │
└─────────────────────────────────────────────────────────────┘
```

1. **Herramientas (`Tools`):** Funciones ejecutables invocadas directamente por el modelo de IA para realizar acciones con efectos secundarios (por ejemplo: dibujar polilíneas, extruir sólidos o activar capas en AutoCAD).
2. **Recursos (`Resources`):** Datos e información de solo lectura expuestos por la aplicación host (por ejemplo: lista de capas activas, coordenadas del boceto `.dwg`, historial de entidades).
3. **Prompts:** Plantillas preconfiguradas y parametrizadas para estructurar la interacción técnica entre el usuario y la IA.

---

## 4. Integración de AutoCAD con IA mediante Servidores MCP

Actualmente, la interoperabilidad entre modelos de IA y AutoCAD no es una función nativa de Autodesk, sino un desarrollo comunitario basado en MCP:

* **Mecanismo de Enlace:** Servidores locales en **Python** o **AutoLISP** que traducen las solicitudes JSON-RPC del LLM en llamadas a la **API COM de Windows** (`ActiveX / pywin32`).
* **Capacidades en Tiempo Real:**
  - Inspección del archivo activo `.dwg` (capas, entidades, límites de dibujo).
  - Generación automatizada de geometría 2D y cotas paramétricas.
  - Creación de cuerpos sólidos 3D mediante operaciones fundamentales:
    - Extrusión (`_EXTRUDE`)
    - Revolución (`_REVOLVE`)
    - Barrido (`_SWEEP`)
    - Operaciones booleanas (`_UNION`, `_SUBTRACT`, `_INTERSECT`)

---

## 🔗 Enlaces Relacionados
- [[02_Comparativa_Modelos_IA|Siguiente: Comparativa de Modelos IA →]]
- [[03_Referencias_IEEE|Referencias Bibliográficas IEEE →]]
- [[../02_Prompts/00_Indice_Prompts|Ver Banco de Prompts →]]
