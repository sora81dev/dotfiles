#Requires AutoHotkey v2.0
#SingleInstance Force

F13::LCtrl          ; CapsLock              -> Ctrl
sc070::#^.          ; Hiragana / Katakana   -> Win  + Ctrl  + .     (PowerToys Run)
sc079::^+Tab        ; Convert               -> Ctrl + Shift + Tab   (WezTerm Tab Moving)
sc07B::^+T          ; Nonconvert            -> Ctrl + Shift + T     (WezTerm New Tab)
*<+<#F23:: return   ; Copilot               -> Disable

#C:: {              ; Win + C               -> WezTerm
  if WinExist("ahk_exe wezterm-gui.exe")
    WinActivate
  else
    Run "C:\Program Files\WezTerm\wezterm-gui.exe"
    WinWait "ahk_exe wezterm-gui.exe"
    WinActivate
}

#F:: {              ; Win + F               -> Switch Maximize
  MouseGetPos , , &pid

  if WinGetMinMax("A") == 1
    WinRestore "ahk_id" pid
  else
    WinMaximize "ahk_id" pid
}

#Q:: {              ; Win + Q               -> Kill Process
  MouseGetPos , , &pid
  WinKill "ahk_id" pid
}
