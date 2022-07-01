# How to install
Install pre-reqs:
1. Install docker and docker-compose
2. if running windows check the box for wsl 2 (TODO be more specific about this)

Configure options:
- WAN port (the port your router will allow traffic on): `vpn.environment.SERVERPORT`
- LAN port (the port your computer listens for locally): `vpn.ports`
- users: specify the names in `vpn.environments.PEERs` comma seperated
- TODO: this isn't needed. update the `wg0.conf` file to DROP requests to your network (ex. if my network is 192.168.0.0/24):
```conf
[Interface]
# ...
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -I FORWARD -i %i -d 192.168.1.1/24 -j DROP; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -i %i -d 192.168.1.1/24 -j DROP; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
```
(I'm adding the second rule in each post)

Create a folder for save files and vpn secrets. In docker-compose.yml mine is `./volumes/`

Enable your router to accept traffic on that WAN port and forward it to the correct LAN port

inside this folder, run `docker-compose up`. See also Docker Desktop for easier commands

