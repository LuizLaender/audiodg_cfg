@echo off

net stop W32Time

wmic process where name="audiodg.exe" CALL setpriority "realtime"
powershell -Command "& {Get-Process audiodg | ForEach-Object {$_.ProcessorAffinity = 1}}"

net start W32Time

w32tm /resync

pause