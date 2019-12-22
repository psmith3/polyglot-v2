# UDI Polyglot v2 for Docker on Synology

Polyglot is a Middleware between the [Universal Devices ISY Home Automation device](http://www.universal-devices.com/) and any number of external devices and services. 

This repository provides the necessary requirments to run the latest UDI Polyglot-v2 build in Docker running on a Synology NAS. I specifically run a DS1815+. It uses the node:10-alpine container from the original polyglot-v2 dockerfile at https://github.com/UniversalDevicesInc/polyglot-v2/tree/master/docker 

To clone this repository, you will need git installed. Log onto your Synology NAS and install the Git Server Package from the Package Store.

This installation will create docker containers for polyglot-v2 and mongo. Local volumes will be created for the polyglot-v2 configuration and mongo database and will be persistant across reboots. Both containers use the docker host network so that polyglot will find your ISY and nodeservers will auto discover local devices in the network.

### Installation instructions

1) ssh into your NAS.

2) Enter the following commands at the $ prompt. 

		cd volume1/docker/

3) Enter the following commands at the $ prompt. 
		
		sudo git clone https://github.com/psmith3/polyglot-v2.git

4) Enter your admin Password: 

5) Enter the following commands at the $ prompt. 

		cd polyglot-v2/
		
		./install.sh 

Done. Polyglot v2 should now be running in Docker. Access via webbrowser at https://{docker ip address}:3000

		
Your browser may not allow you to view the webpage because the ssl certs are not signed. You can allow this with Safari on Mac or you can open a private browser window and access. You can overide the use https setting in the ./dot-polyglot/.env file to overcome this, but you will have to manually edit each node server in the ISY and uncheck SSL. If required, edit the .env.example file in the ./dot-polyglot directory and save the file as .env.

Your ISY will be discovered, but you will have to go to the settings page and enter your ISY username and password.

Thanks to einstein.42 for his original work. 

Enjoy!
