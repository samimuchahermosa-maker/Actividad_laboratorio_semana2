;;; ==========================================================================
;;; Archivo: generar_geometrias_3d.lsp
;;; Proyecto: Actividad_laboratorio_semana2
;;; Descripción: Rutinas AutoLISP automatizadas para AutoCAD 3D
;;;              (Sintaxis universal protegida con guion bajo)
;;; ==========================================================================

;;; --------------------------------------------------------------------------
;;; 1. Comando: CrearCilindroBase
;;; Descripción: Crea un cilindro en (500,50,0) con radio 35 y altura 110
;;;              en la capa 06_CILINDRO.
;;; --------------------------------------------------------------------------
(defun c:CrearCilindroBase ()
  (princ "\n[AutoLISP] Generando Cilindro Base...")
  (command "_.layer" "_M" "06_CILINDRO" "_C" "6" "" "")
  (command "_.cylinder" '(500 50 0) 35.0 110.0)
  (princ "\n[OK] Cilindro base creado con éxito.")
  (princ)
)

;;; --------------------------------------------------------------------------
;;; 2. Comando: CrearPrismaPentagonal
;;; Descripción: Dibuja un polígono pentagonal regular inscrito con radio
;;;              68.052 mm centrado en (0,0,0) y lo extruye 60 mm en 01_PRISMA.
;;; --------------------------------------------------------------------------
(defun c:CrearPrismaPentagonal ()
  (princ "\n[AutoLISP] Generando Prisma Pentagonal Regular...")
  (command "_.layer" "_M" "01_PRISMA" "_C" "1" "" "")
  ;; Polígono de 5 lados con centro en (0,0,0) inscrito (_I)
  (command "_.polygon" 5 '(0 0 0) "_I" 68.052)
  ;; Extruir la última entidad creada (_L = Last) a 60 mm
  (command "_.extrude" "_L" "" 60.0)
  (princ "\n[OK] Prisma pentagonal generado en capa 01_PRISMA.")
  (princ)
)

;;; --------------------------------------------------------------------------
;;; 3. Comando: CrearPasadorRevolucion
;;; Descripción: Crea un semiperfil rectangular y genera un pasador cilíndrico
;;;              por revolución de 360 grados sobre el eje Y en 02_PASADOR.
;;; --------------------------------------------------------------------------
(defun c:CrearPasadorRevolucion ()
  (princ "\n[AutoLISP] Generando Pasador por Revolución 360°...")
  (command "_.layer" "_M" "02_PASADOR" "_C" "2" "" "")
  ;; Semiperfil cerrado (radio 7.5 mm, longitud 40 mm)
  (command "_.pline" '(0 0 0) '(7.5 0 0) '(7.5 40 0) '(0 40 0) "_C")
  ;; Revolucionar el perfil sobre el eje vertical Y
  (command "_.revolve" "_L" "" '(0 0 0) '(0 40 0) 360.0)
  (princ "\n[OK] Pasador por revolución generado en capa 02_PASADOR.")
  (princ)
)

;;; --------------------------------------------------------------------------
;;; 4. Comando: CrearBarridoAlambre
;;; Descripción: Barre un círculo de radio 0.4 mm sobre la directriz 'clip_path'
;;;              en la capa 03_BARRIDO evitando auto-intersección.
;;; --------------------------------------------------------------------------
(defun c:CrearBarridoAlambre ( / ssPath ptStart)
  (princ "\n[AutoLISP] Ejecutando barrido sobre trayectoria...")
  (command "_.layer" "_M" "03_BARRIDO" "_C" "3" "" "")
  (setq ssPath (ssget "_X" '((0 . "*POLYLINE") (8 . "03_BARRIDO"))))
  (if ssPath
    (progn
      (vl-load-com)
      (setq ptStart (vlax-curve-getStartPoint (ssname ssPath 0)))
      ;; Círculo de perfil perpendicular con radio 0.4 mm
      (command "_.circle" ptStart 0.4)
      ;; Barrer sobre la polilínea
      (command "_.sweep" "_L" "" ssPath)
      (princ "\n[OK] Barrido finalizado satisfactoriamente.")
    )
    (princ "\n[AVISO] No se encontró ninguna polilínea en la capa 03_BARRIDO.")
  )
  (princ)
)

(princ "\n=======================================================")
(princ "\nComandos cargados exitosamente:")
(princ "\n  CrearCilindroBase")
(princ "\n  CrearPrismaPentagonal")
(princ "\n  CrearPasadorRevolucion")
(princ "\n  CrearBarridoAlambre")
(princ "\n=======================================================\n")
(princ)

