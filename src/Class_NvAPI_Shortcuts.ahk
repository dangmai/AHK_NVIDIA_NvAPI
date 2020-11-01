#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include Class_NvAPI.ahk
VibranceSettings := [50, 100]

Index := 1

^!+j::
    Sysget, MonitorCount, MonitorCount
    SysGet, PrimaryMonitor, MonitorPrimary
    Sysget, PrimaryMonitorName, MonitorName, PrimaryMonitor

    ; Looping through the monitors to find the NVidia primary display
    ; We have to do this instead of using PrimaryMonitor directly because
    ; sometimes nVidia and Windows use different indexes for the primary
    ; monitor
    loop % MonitorCount {
        monitorIndex := A_Index - 1
        currentMonitor := NvAPI.GetAssociatedNvidiaDisplayName(monitorIndex)
        if (currentMonitor == PrimaryMonitorName) {
            Index := Mod(Index, VibranceSettings.MaxIndex()) + 1
            NvAPI.SetDVCLevelEx(VibranceSettings[Index], monitorIndex)
        }
    }
return