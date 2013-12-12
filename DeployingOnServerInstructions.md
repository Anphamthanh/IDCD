from a terminal 
---------------
command:	`sudo vpnc`

	if needed...
	IPSec gateway: `ipsec2.vpn.gatech.edu`
	IPSec ID: `gatech`
	IPSec secret: `vpn4tech`
	username: *your gt username*
	password: *your gt password*

command:	`ssh survy@medesign.me.gatech.edu`

password:	*ask me*


now you are in survy@medesign
-----------------------------
command:	`cd /webapp/IDCD/`

command:	`sudo su -s /bin/bash passenger`


now you are in passenger@medesign
---------------------------------
command: 	`./reconstruct_server.sh`
