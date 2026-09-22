---
titulo: "Guía de Configuración y Despliegue de MCP para AutoCAD"
tipo: "configuracion"
proyecto: "Actividad_laboratorio_semana2"
tags:
  - configuracion
  - despliegue
  - mcp
  - autolisp
  - pywin32
---

# Guía de Instalación y Despliegue (MCP & AutoCAD)

Esta guía documenta los pasos necesarios para habilitar la comunicación entre el asistente de inteligencia artificial y **AutoCAD** mediante servidores de **Model Context Protocol (MCP)** y scripts locales.

---

## 1. Carga de Rutinas AutoLISP en AutoCAD

Para ejecutar los scripts generados en `src/generar_geometrias_3d.lsp` directamente dentro de AutoCAD:

1. Inicia AutoCAD y abre tu dibujo `.dwg`.
2. En la línea de comandos, escribe:
   ```text
   APPLOAD
   ```
3. Navega al directorio `/src` de este proyecto y selecciona el archivo `generar_geometrias_3d.lsp`.
4. Haz clic en **Load** (Cargar).
5. Comandos disponibles de prueba en la consola:
   - `CrearCilindroBase`
   - `CrearPrismaPentagonal`
   - `CrearPasadorRevolucion`
   - `CrearBarridoAlambre`

---

## 2. Configuración del Servidor MCP para AutoCAD (Comunitario)

Los servidores MCP para CAD (como `cad-mcp` o `multiCAD-mcp`) permiten exponer herramientas mediante la API COM de Windows (`ActiveX / pywin32`).

### Requisitos Previos:
- Python 3.10 o superior.
- AutoCAD (versión 2021 a 2027) con API COM habilitada.
- Instalar dependencias en el entorno virtual:
  ```bash
  pip install pywin32 mcp
  ```

### Configuración en el Cliente de IA (ej. Claude Desktop / Antigravity MCP):
Añade el servidor a tu archivo de configuración `claude_desktop_config.json` o `.gemini/mcp_config.json`:

```json
{
  "mcpServers": {
    "autocad-mcp": {
      "command": "python",
      "args": ["-m", "cad_mcp_server"],
      "env": {
        "AUTOCAD_VERSION": "2027"
      }
    }
  }
}
```

---

## 🔗 Enlaces Relacionados
- [[../01_Investigacion/01_MCP_AutoCAD_Arquitectura|← Investigación MCP]]
- [[../02_Prompts/00_Indice_Prompts|← Banco de Prompts]]
- [[../02_Prompts/06_Prompt_Few_Shot_AutoLISP|Prompt Few-Shot AutoLISP →]]
