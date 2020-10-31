#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include Class_NvAPI.ahk
VibranceSettings := [50, 100]

Index := 1

^!+j::
    Index := Mod(Index, VibranceSettings.MaxIndex()) + 1
    NvAPI.SetDVCLevelEx(VibranceSettings[Index], 0)
return