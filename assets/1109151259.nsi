


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 头文件
!include "MUI.nsh"
!include "Sections.nsh"
!include "LogicLib.nsh"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 宏定义
!define STR_AppName "CuteFoto"
!define STR_Version "2.2.240"
!define STR_Publisher "http://safelong.github.io/"
!define STR_HomepageUrl "http://Yonsm.zj.com"

!define REG_AppPath "Software\Microsoft\Windows\CurrentVersion\App Paths\${STR_AppName}.exe"
!define REG_Uninstall "Software\Microsoft\Windows\CurrentVersion\Uninstall\${STR_AppName}"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MUI 设置
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange-uninstall.bmp"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\orange.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-uninstall.bmp"

; 组件页面设置
!define MUI_COMPONENTSPAGE_SMALLDESC

; 完成安装页面设置
!define MUI_FINISHPAGE_RUN "$INSTDIR\${STR_AppName}.exe"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\${STR_AppName}.chm"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "$(LNG_ShowHelp)"
!define MUI_FINISHPAGE_LINK "${STR_AppName} $(LNG_Homepage): ${STR_HomepageUrl}"
!define MUI_FINISHPAGE_LINK_LOCATION "${STR_HomepageUrl}"

; 语言选择设置
!define MUI_LANGDLL_REGISTRY_ROOT "HKLM"
!define MUI_LANGDLL_REGISTRY_KEY "${REG_Uninstall}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; 安装页面
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "$(LNG_License)"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; 卸载页面
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; 语言支持
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 语言相关字符串
LicenseLangString LNG_License ${LANG_ENGLISH} "EULA.ENU.rtf"
LangString LNG_BrandingText ${LANG_ENGLISH} "Expert -> Professional -> Absorbedly"

LangString LNG_DefaultInstation ${LANG_ENGLISH} "Default installtion"
LangString LNG_FullInstation ${LANG_ENGLISH} "Full installtion"
LangString LNG_MinimalInstation ${LANG_ENGLISH} "Minimal installtion"

LangString LNG_Help ${LANG_ENGLISH} "Help"
LangString LNG_Homepage ${LANG_ENGLISH} "Homepage"
LangString LNG_Uninstall ${LANG_ENGLISH} "Uninstall"
LangString LNG_ShowHelp ${LANG_ENGLISH} "Show Help"

LangString LNG_ProgramFile ${LANG_ENGLISH} "Program Files"
LangString LNG_LanguageFile ${LANG_ENGLISH} "Language Files"
LangString LNG_CreateShortcut ${LANG_ENGLISH} "Create Shortcut"

LangString LNG_ProgramMenuShortcutGroup ${LANG_ENGLISH} "Program Menu Shortcut Group"
LangString LNG_DesktopShortcut ${LANG_ENGLISH} "Desktop Shortcut"
LangString LNG_ProgramMenuShortcut ${LANG_ENGLISH} "Program Menu Shortcut"
LangString LNG_StartMenuShortcut ${LANG_ENGLISH} "Start Menu Shortcut"
LangString LNG_QuickLaunchShortcut ${LANG_ENGLISH} "Quick Launch Bar Shortcut"

LangString LNG_ProgramFileDesc ${LANG_ENGLISH} "Install ${STR_AppName} program files."
LangString LNG_LanguageFileDesc ${LANG_ENGLISH} "Install ${STR_AppName} language files."
LangString LNG_CreateShortcutDesc ${LANG_ENGLISH} "Create shortcuts to launch the program easy."

LangString LNG_X86AsciiDesc ${LANG_ENGLISH} "ASCII version on WIN32 platform for X86 architecture (The only choice on WIN9X OS for X86 architecture)."
LangString LNG_X86UnicodeDesc ${LANG_ENGLISH} "Unicode version on WIN32 platform for X86 architecture (Preferred on WINNT OS for X86 architecture)."
LangString LNG_X64UnicodeDesc ${LANG_ENGLISH} "Unicode version on WIN64 platform for X64 architecture (Preferred on WIN64 OS for X64 architecture)."


LicenseLangString LNG_License ${LANG_SIMPCHINESE} "EULA.CHS.rtf"
LangString LNG_BrandingText ${LANG_SIMPCHINESE} "专家 -> 专业 -> 专心"

LangString LNG_DefaultInstation ${LANG_SIMPCHINESE} "默认安装"
LangString LNG_FullInstation ${LANG_SIMPCHINESE} "完全安装"
LangString LNG_MinimalInstation ${LANG_SIMPCHINESE} "最小安装"

LangString LNG_Help ${LANG_SIMPCHINESE} "帮助"
LangString LNG_Homepage ${LANG_SIMPCHINESE} "主页"
LangString LNG_Uninstall ${LANG_SIMPCHINESE} "卸载"
LangString LNG_ShowHelp ${LANG_SIMPCHINESE} "查看帮助"

LangString LNG_ProgramFile ${LANG_SIMPCHINESE} "程序文件"
LangString LNG_LanguageFile ${LANG_SIMPCHINESE} "语言文件"
LangString LNG_CreateShortcut ${LANG_SIMPCHINESE} "创建快捷方式"

LangString LNG_ProgramMenuShortcutGroup ${LANG_SIMPCHINESE} "程序菜单快捷方式组"
LangString LNG_DesktopShortcut ${LANG_SIMPCHINESE} "桌面快捷方式"
LangString LNG_ProgramMenuShortcut ${LANG_SIMPCHINESE} "程序菜单快捷方式"
LangString LNG_StartMenuShortcut ${LANG_SIMPCHINESE} "开始菜单快捷方式"
LangString LNG_QuickLaunchShortcut ${LANG_SIMPCHINESE} "快速启动栏快捷方式"

LangString LNG_ProgramFileDesc ${LANG_SIMPCHINESE} "安装 ${STR_AppName} 程序文件。"
LangString LNG_LanguageFileDesc ${LANG_SIMPCHINESE} "安装 ${STR_AppName} 语言文件。"
LangString LNG_CreateShortcutDesc ${LANG_SIMPCHINESE} "创建用于快速访问的快捷方式。"

LangString LNG_X86AsciiDesc ${LANG_SIMPCHINESE} "安装 X86 架构 WIN32 平台上的  ASCII 版本。这是在 X86 架构 WIN9X 类操作系统中的唯一选择。"
LangString LNG_X86UnicodeDesc ${LANG_SIMPCHINESE} "安装 X86 架构 WIN32 平台上的 UNICODE 版本。这是在 X86 架构 WINNT 类操作系统中的优先选择。"
LangString LNG_X64UnicodeDesc ${LANG_SIMPCHINESE} "安装 X64 架构 WIN64 平台上的 UNICODE 版本。这是在 X64 架构 WIN64 类操作系统中的优先选择。"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 杂项
Name "${STR_AppName} ${STR_Version}"
OutFile "${STR_AppName}.${STR_Version}.exe"
InstallDir "$PROGRAMFILES\${STR_AppName}"
InstallDirRegKey HKLM "${REG_AppPath}" ""
ShowInstDetails SHOW
ShowUnInstDetails SHOW
BrandingText "$(LNG_BrandingText)"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 安装类型
!ifndef NOINSTTYPES
	InstType "$(LNG_DefaultInstation)"
	InstType "$(LNG_FullInstation)"
	InstType "$(LNG_MinimalInstation)"
!endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 程序文件
Section
SectionEnd
SectionGroup /e "$(LNG_ProgramFile)" SEC_ProgramFile
	Section "-HelpFile" SEC_HelpFile
		SetOutPath "$INSTDIR"
		SetOverwrite ON 
		
		File "..\Help\CuteFoto.chm"
	SectionEnd

	Section "X86 ASCII" SEC_X86Ascii
		SectionIn 1 2 3
		File "..\Release\CuteFoto.exe"
	SectionEnd

	Section "X86 UNICODE" SEC_X86Unicode
		SectionIn 5 RO
		File "..\Unicode\Release\CuteFoto.exe"
	SectionEnd

	Section "X64 UNICODE" SEC_X64Unicode
		SectionIn 5 RO
		File "..\AMD64\Release\CuteFoto.exe"
	SectionEnd
SectionGroupEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 语言文件
SectionGroup "$(LNG_LanguageFile)" SEC_LanguageFile
	Section "English" SEC_English
		SectionIn 2
		File "..\Release\English.lng"
	SectionEnd

	Section "CAPITAL ENGLISH" SEC_CapitalEnglish
		SectionIn 1 2
		File "..\Release\English (Capital).lng"
	SectionEnd

	Section "简体中文" SEC_SimplifiedChinese
		SectionIn 1 2
		File "..\Release\Chinese (Simplified).lng"
	SectionEnd
SectionGroupEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 快捷方式
SectionGroup "$(LNG_CreateShortcut)" SEC_Shortcut
	SectionGroup "$(LNG_ProgramMenuShortcutGroup)" SEC_ProgramMenuShortcutGroup
		Section "${STR_AppName}" SEC_AppNameShortcut
			SectionIn 1 2
			CreateDirectory "$SMPROGRAMS\${STR_AppName}"
			CreateShortCut "$SMPROGRAMS\${STR_AppName}\${STR_AppName}.lnk" "$INSTDIR\${STR_AppName}.exe"
		SectionEnd

		Section "${STR_AppName} $(LNG_Help)" SEC_HelpShortcut
			SectionIn 1 2
			CreateDirectory "$SMPROGRAMS\${STR_AppName}"
			CreateShortCut "$SMPROGRAMS\${STR_AppName}\${STR_AppName} $(LNG_Help).lnk" "$INSTDIR\${STR_AppName}.chm"
		SectionEnd

		Section "${STR_AppName} $(LNG_Homepage)" SEC_HomePageShortcut
			SectionIn 1 2
			CreateDirectory "$SMPROGRAMS\${STR_AppName}"
			WriteINIStr "$SMPROGRAMS\${STR_AppName}\${STR_AppName} $(LNG_Homepage).url" "InternetShortcut" "URL" "${STR_HomepageUrl}"
		SectionEnd

		Section "$(LNG_Uninstall) ${STR_AppName}" SEC_UninstallShortcut
			SectionIn 1 2
			CreateDirectory "$SMPROGRAMS\${STR_AppName}"
			CreateShortCut "$SMPROGRAMS\${STR_AppName}\$(LNG_Uninstall) ${STR_AppName}.lnk" "$INSTDIR\Uninstall ${STR_AppName}.exe"
		SectionEnd
	SectionGroupEnd

	Section "$(LNG_DesktopShortcut)" SEC_DesktopShortcut
		SectionIn 1 2
		CreateShortCut "$DESKTOP\${STR_AppName}.lnk" "$INSTDIR\${STR_AppName}.exe"
	SectionEnd

	Section "$(LNG_ProgramMenuShortcut)" SEC_ProgramMenuShortcut
		SectionIn 2
		CreateShortCut "$SMPROGRAMS\${STR_AppName}.lnk" "$INSTDIR\${STR_AppName}.exe"
	SectionEnd
	
	Section "$(LNG_StartMenuShortcut)" SEC_StartMenuShortcut
		SectionIn 2
		CreateShortCut "$STARTMENU\${STR_AppName}.lnk" "$INSTDIR\${STR_AppName}.exe"
	SectionEnd

	Section "$(LNG_QuickLaunchShortcut)" SEC_QuickLaunchShortcut
		SectionIn 2
		CreateShortCut "$QUICKLAUNCH\${STR_AppName}.lnk" "$INSTDIR\${STR_AppName}.exe"
	SectionEnd
SectionGroupEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 完成安装
Section "-PostInstall"
	WriteUninstaller "$INSTDIR\Uninstall ${STR_AppName}.exe"
	WriteRegStr HKLM "${REG_AppPath}" "" "$INSTDIR\CuteFoto.exe"
	WriteRegStr HKLM "${REG_Uninstall}" "DisplayName" "$(^Name)"
	WriteRegStr HKLM "${REG_Uninstall}" "UninstallString" "$INSTDIR\Uninstall ${STR_AppName}.exe"
	WriteRegStr HKLM "${REG_Uninstall}" "DisplayIcon" "$INSTDIR\CuteFoto.exe"
	WriteRegStr HKLM "${REG_Uninstall}" "DisplayVersion" "${STR_Version}"
	WriteRegStr HKLM "${REG_Uninstall}" "URLInfoAbout" "${STR_HomepageUrl}"
	WriteRegStr HKLM "${REG_Uninstall}" "Publisher" "${STR_Publisher}"
SectionEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 卸载
Section "Uninstall"
	Delete /REBOOTOK "$SMPROGRAMS\${STR_AppName}\${STR_AppName}.lnk"
	Delete /REBOOTOK "$SMPROGRAMS\${STR_AppName}\${STR_AppName} $(LNG_Help).lnk"
	Delete /REBOOTOK "$SMPROGRAMS\${STR_AppName}\${STR_AppName} $(LNG_Homepage).url"
	Delete /REBOOTOK "$SMPROGRAMS\${STR_AppName}\$(LNG_Uninstall) ${STR_AppName}.lnk"

	Delete /REBOOTOK "$DESKTOP\${STR_AppName}.lnk"
	Delete /REBOOTOK "$SMPROGRAMS\${STR_AppName}.lnk"
	Delete /REBOOTOK "$STARTMENU\${STR_AppName}.lnk"
	Delete /REBOOTOK "$QUICKLAUNCH\${STR_AppName}.lnk"

	Delete /REBOOTOK "$INSTDIR\${STR_AppName}.exe"
	Delete /REBOOTOK "$INSTDIR\${STR_AppName}.chm"
	Delete /REBOOTOK "$INSTDIR\English.lng"
	Delete /REBOOTOK "$INSTDIR\English (Capital).lng"
	Delete /REBOOTOK "$INSTDIR\Chinese (Simplified).lng"

	Delete /REBOOTOK "$INSTDIR\${STR_AppName}.ini"
	Delete /REBOOTOK "$INSTDIR\Uninstall ${STR_AppName}.exe"

	RMDir /REBOOTOK "$SMPROGRAMS\${STR_AppName}"
	RMDir /REBOOTOK "$INSTDIR"

	DeleteRegKey HKLM "${REG_Uninstall}"
	DeleteRegKey HKLM "${REG_AppPath}"
	SetAutoClose True
SectionEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 节描述
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_ProgramFile} "$(LNG_ProgramFileDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_LanguageFile} "$(LNG_LanguageFileDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_Shortcut} "$(LNG_CreateShortcutDesc)"

	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_X86Ascii} "$(LNG_X86AsciiDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_X86Unicode} "$(LNG_X86UnicodeDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_X64Unicode} "$(LNG_X64UnicodeDesc)"

	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_English} "Install language file: English (For translation only)."
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_CapitalEnglish} "INSTALL LANGUAGE FILE: CAPITAL ENGLISH."
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_SimplifiedChinese} "安装语言文件: 简体中文。"

	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_ProgramMenuShortcutGroup} "$(LNG_CreateShortcutDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_DesktopShortcut} "$(LNG_CreateShortcutDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_ProgramMenuShortcut} "$(LNG_CreateShortcutDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_StartMenuShortcut} "$(LNG_CreateShortcutDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_QuickLaunchShortcut} "$(LNG_CreateShortcutDesc)"

	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_AppNameShortcut} "$(LNG_CreateShortcutDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_HelpShortcut} "$(LNG_CreateShortcutDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_HomePageShortcut} "$(LNG_CreateShortcutDesc)"
	!insertmacro MUI_DESCRIPTION_TEXT ${SEC_UninstallShortcut} "$(LNG_CreateShortcutDesc)"
!insertmacro MUI_FUNCTION_DESCRIPTION_END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 初始化回调函数
Function .onInit
	StrCpy $1 ${SEC_X86Ascii}

	ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" "CurrentVersion"
	${If} $0 != ""
		SectionSetInstTypes ${SEC_X86Ascii} 0
		!insertmacro UnselectSection ${SEC_X86Ascii}
		!insertmacro ClearSectionFlag ${SEC_X86Unicode} ${SF_RO}

		ReadRegStr $0 HKLM "SYSTEM\CurrentControlSet\Control\Session Manager\Environment" "PROCESSOR_ARCHITECTURE"
		${If} $0 != "AMD64"
			SectionSetInstTypes ${SEC_X86Unicode} 7
			!insertmacro SelectSection ${SEC_X86Unicode}
			StrCpy $1 ${SEC_X86Unicode}
		${Else}
			SectionSetInstTypes ${SEC_X64Unicode} 7
			!insertmacro ClearSectionFlag ${SEC_X64Unicode} ${SF_RO}
			!insertmacro SelectSection ${SEC_X64Unicode}
			StrCpy $1 ${SEC_X64Unicode}
		${EndIf}		
	${EndIf}
	
	!insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 选择改变
Function .onSelChange
	!insertmacro StartRadioButtons $1
		!insertmacro RadioButton ${SEC_X86Ascii}
		!insertmacro RadioButton ${SEC_X86Unicode}
		!insertmacro RadioButton ${SEC_X64Unicode}
	!insertmacro EndRadioButtons
FunctionEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 卸载初始化
Function un.onInit
	!insertmacro MUI_UNGETLANGUAGE
FunctionEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
