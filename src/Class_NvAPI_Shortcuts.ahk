#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include Class_NvAPI.ahk
Monitor := 1
VibranceSettings := [50, 100]

Index := 1

^!+j::
    Index := Mod(Index, VibranceSettings.MaxIndex()) + 1
    NvAPI.SetDVCLevelEx(VibranceSettings[Index], Monitor)
return