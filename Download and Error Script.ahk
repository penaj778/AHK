#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetDefaultMouseSpeed, 0
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window
SendMode Event
#SingleInstance Force
SetTitleMatchMode 3
SetTitleMatchMode Fast
DetectHiddenWindows Off
DetectHiddenText Off
#WinActivateForce
SetKeyDelay 1
SetBatchLines -1
#Persistent

CDKSecurityWarning:
SetTimer, CDKSecurityWarning, 50
IfWinActive, Application Run - Security Warning
{
	CurrentKeyDelay := A_KeyDelay
	SetKeyDelay, 1
	SendEvent, {Left}{Enter}
	SetKeyDelay, %CurrentKeyDelay%
		}
			IfWinNotActive, Application Run - Security Warning
		{
}

LogOff_Error_Condition:
SetTimer, LogOff_Error_Condition, 51
LogOffError := "wiPortalManager.CookieHelper.SetCookie(String siteUrl, String cookieName, String cookieData, Boolean cookieHttpOnly, Boolean cookieSecure)"
IfWinExist, Error Condition ahk_class WindowsForms10.Window.8.app.0.225e691_r33_ad2
{
    WinActivate, Error Condition ahk_class WindowsForms10.Window.8.app.0.225e691_r33_ad2
    Sleep, 200
    ControlGetText, LogOffError, WindowsForms10.RichEdit20W.app.0.225e691_r33_ad21, Error Condition ahk_class WindowsForms10.Window.8.app.0.225e691_r33_ad2
    If LogOffError contains wiPortalManager.CookieHelper.SetCookie(String siteUrl`, String cookieName`, String cookieData`, Boolean cookieHttpOnly`, Boolean cookieSecure)
		{
			WinKill, Error Condition ahk_class WindowsForms10.Window.8.app.0.225e691_r33_ad2
		}
}

PreLoad_Error:
SetTimer, PreLoad_Error, 52
IfWinExist, PreLoad Error
{
    WinKill, PreLoad Error
}

ScriptStop:
SetTimer, ScriptStop, 53
IfWinExist, Web Browser ahk_class #32770 ahk_exe wsStart_4.exe
{
    WinKill, Web Browser ahk_class #32770 ahk_exe wsStart_4.exe
}

Return