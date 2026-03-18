# zabbix-installer

A tiny Windows **.bat** that automates installing the **Zabbix Agent 2** via MSI (version is whatever the script points at, currently: **7.4.8**).

## Why this exists
I built this to live on a **shared drive** and get pushed via a **GPO linked to the Servers OU** so every server installs the agent automatically.

Result:
- new server joins the domain
- GPO runs the script
- agent installs (quietly)
- I just add the server as a host in the Zabbix Web UI  
Clean, consistent deployment, because “click-next-next-finish” is not a scaling strategy and i have other servers to set up in the meantime.

## What it does
- Checks if **“Zabbix Agent 2”** is already installed  
  → if yes, it exits politely and doesn’t reinstall
- Runs `msiexec` **silently** (`/qn`)
- Sets common MSI properties like:
  - `SERVER`, `SERVERACTIVE`
  - `HOSTNAME=%COMPUTERNAME%`
  - TLS PSK settings (optional but recommended)

## How to use
1. Edit `zabbix-installer.bat`:
   - point the MSI path to your share
   - set your Zabbix server IP/DNS
   - set TLS PSK values (if you use PSK)
2. Put the script + MSI on a share accessible by your servers.
3. Deploy via GPO (Startup Script recommended).
4. Enjoy an army of monitored servers with minimal human involvement (SkyNet v1.0?).

## Notes
This script is intentionally short. If it got any longer it would become “documentation,” and nobody wants that.
Enjoy! 

Made with ☕ by Santiago Toro
