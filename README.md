# WireGuard Startup Script

![visitors](https://visitor-badge.glitch.me/badge?page_id=modesttom.wg-start&left_color=gray&right_color=blue)

**This project is a simple bash script that is for the purpose of utilizing multiple [WireGuard](https://www.wireguard.com/) configurations (you do not need multiple).**



## Requirements

- A Linux Distribution
- WireGuard installation. See [WireGuard Installer](https://github.com/angristan/wireguard-install) for a quick and easy installation.
- This script searches for configurations in WireGuard's default configuration directory `/etc/wireguard`

## Usage

Download and run the script. I personally store it in `/usr/bin` but you may run it from anywhere.

```bash
curl -O https://raw.githubusercontent.com/ModestTom/wg-start/main/wg-start.sh
```
or
```bash
wget https://raw.githubusercontent.com/ModestTom/wg-start/main/wg-start.sh
```
then
```bash
chmod +x wg-start.sh
sudo ./wg-start.sh
```

It will check for any currently running WireGuard clients and prompt you to either stop it or not. If no clients are active, it will scan the default configuration directory for WireGuard `/etc/wireguard` and prompt you to choose one to start. You can run it again to stop the client.



