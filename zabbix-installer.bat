@echo off
sc query "Zabbix Agent 2" >nul 2>&1
IF %ERRORLEVEL% EQU 0 exit /b 0

msiexec /i "\\path\to\your\msi\installer\zabbix_agent2-7.4.8-windows-amd64-openssl.msi"^
 /qn^
 SERVER=your.zabbix.server.ip^
 SERVERACTIVE=your.zabbix.server.ip^
 HOSTNAME=%COMPUTERNAME%^
 TLSCONNECT=psk^
 TLSACCEPT=psk^
 TLSPSKIDENTITY=yourpskidentity^
 TLSPSKVALUE=yourpskvalue^
 /norestart
