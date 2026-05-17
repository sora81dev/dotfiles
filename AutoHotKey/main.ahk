#Requires AutoHotkey v2.0
#SingleInstance Force

F13::LCtrl          ; CapsLock              -> Ctrl
sc070::#^.          ; Hiragana / Katakana   -> Win  + Ctrl  + .     (PowerToys Run)
sc079::^+Tab        ; Convert               -> Ctrl + Shift + Tab   (WezTerm Tab Moving)
sc07B:: return      ; Nonconvert            -> Disable
*<+<#F23:: return   ; Copilot               -> Disable
