; Script generated by the HM NIS Edit Script Wizard.
 
; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "CellCognition Explorer Deep Learning"
!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "CellCognition"

 
; !include "UserManagement.nsh"
 

!include "MUI2.nsh"
!include x64.nsh
 
; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
 
; Welcome page
!define MUI_WELCOMEPAGE_TITLE_3LINES
!insertmacro MUI_PAGE_WELCOME

; Components page
!insertmacro MUI_PAGE_COMPONENTS

; Instfiles page
!insertmacro MUI_PAGE_INSTFILES

; Finish page
!define MUI_FINISHPAGE_TITLE_3LINES
!insertmacro MUI_PAGE_FINISH
 
; Language files
!insertmacro MUI_LANGUAGE "English"
 
; Reserve files
;!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; MUI end ------
 
Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "CellCognitonExplorer_cedl-gui_docker_win7-8_setup.exe"
InstallDir "$PROGRAMFILES\CellCognitionExplorer\cedl-gui"
ShowInstDetails show

Section "CellCognition Explorer CEDL GUI" SecMain
  SetOutPath $INSTDIR
  SectionIn RO
  
  FILE cedl_cmd\cedl_gui_start.sh
  FILE cedl_cmd\cecog_analyzer_icon.ico
  
  SetShellVarContext all
  CreateDirectory "$SMPROGRAMS\CellCognitionExplorer"

    CreateShortCut "$SMPROGRAMS\CellCognitionExplorer\Feature learning GUI.lnk" "$INSTDIR\cedl_gui_start.sh" "" "$INSTDIR\cecog_analyzer_icon.ico"
SectionEnd 
 
Section "XMING XServer for Windows" SEC01
  SetOutPath $INSTDIR
  File "deps\Xming-6-9-0-31-setup.exe"
  ExecWait "$INSTDIR\Xming-6-9-0-31-setup.exe /SILENT"
SectionEnd
 
Section "Docker Toolbox" SEC02
  SetOutPath $INSTDIR
  SetRebootFlag true
  File "deps\DockerToolbox-1.12.5.exe"
  ExecWait "$INSTDIR\DockerToolbox-1.12.5.exe /SILENT"
SectionEnd


 
