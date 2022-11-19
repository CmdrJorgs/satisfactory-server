# How to install
Install pre-reqs:
1. Install docker and docker-compose
2. if running windows check the box for wsl 2 (TODO be more specific about this)

Configure options:
- WAN port (the port your router will allow traffic on): `vpn.environment.SERVERPORT`
- LAN port (the port your computer listens for locally): `vpn.ports`
- users: specify the names in `vpn.environments.PEERs` comma seperated
  - this can be edited at any time, just restart the server
- `vpn.environments.DROPPED_NETWORKS` env var is your home network CIDR block in case you want to block that from the VPN server

Create a folder for save files and vpn secrets. In docker-compose.yml mine is `./volumes/`

Enable your router to accept traffic on that WAN port and forward it to the correct LAN port (allow UDP (and tcp?))

inside this folder, run `docker-compose up`. See also Docker Desktop for easier commands

The test server is just to help verify that clients are connected. So going to 10.1.1.4 on a browser would show "hello world" if they are connected (if the network configuration isn't changed)

# to use the save editor
https://satisfactory-calculator.com/

1. shut down docker
2. select the latest file
3. edit on website
4. replace oen `saves/` and `backups/`