@echo off
echo Building EZE OS Playbook...
if exist "EZE-OS.apbx" del "EZE-OS.apbx"
powershell -NoP -ExecutionPolicy Bypass -Command "Compress-Archive -Path '.\*' -DestinationPath 'EZE-OS.zip' -Force; Rename-Item 'EZE-OS.zip' 'EZE-OS.apbx'"
echo Done! EZE-OS.apbx is ready.
pause
