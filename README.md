# UDI Polyglot v2 for Docker on Synology

Polyglot is a Middleware between the [Universal Devices ISY Home Automation device](http://www.universal-devices.com/) and any number of external devices and services. 

This repository provides the necessary requirments to run the latest UDI Polyglot-v2 build in Docker running on a Synology NAS. I specifically run a DS1815+.

The same requirements exist from https://github.com/UniversalDevicesInc/polyglot-v2

To clone this repository, you will need git installed. Log onto your Synology NAS and install the Git Server Package from the Package Store.

This installation will create docker containers for polyglot-v2 and mongo. Local volumes will be created for the polyglot-v2 configuration and mongo database and will be persistant across reboots. Both containers use the docker host network so that polyglot will find your ISY and nodeservers will auto discover local devices in the network.

### Installation instructions

1) ssh into your NAS.

2) $ cd volume1/docker/

3) $ sudo git clone https://github.com/psmith3/polyglot-v2.git

4) Enter your admin Password: 

		Cloning into 'polyglot-v2'...
		remote: Enumerating objects: 20, done.
		remote: Counting objects: 100% (20/20), done.
		remote: Compressing objects: 100% (19/19), done.
		remote: Total 3832 (delta 6), reused 0 (delta 0), pack-reused 3812
		Receiving objects: 100% (3832/3832), 264.35 MiB | 27.60 MiB/s, done.
		Resolving deltas: 100% (2274/2274), done.

5) $ cd polyglot-v2/

6) $ ./install.sh 

		Installing polyglot-v2 and mongo...
		Running docker-compose up...

7) Enter admin Password if prompted:

		Creating mongodb ... done
		Creating polyglotv2 ... done
		Creating SSL certs & stopping containers...
		Stop running containers without removing them.

		They can be started again with `docker-compose start`.

		Usage: stop [options] [SERVICE...]

		Options:
  		-t, --timeout TIMEOUT      Specify a shutdown timeout in seconds.
                             (default: 10)
		Starting containers...
		mongodb is up-to-date
		polyglotv2 is up-to-date
		Polyglot v2 should now be running in Docker! Access via webbrowser at https://{docker ip address}:3000
		
Your browser may not allow you to view the webpage because the ssl certs are not signed. You can allow this with Safari on Mac or you can open a private browser window and access. You can overide the use https setting in the ./dot-polyglot/.env file to overcome this, but you will have to manually edit each node server in the ISY and uncheck SSL. If required, edit the .env.example file in the ./dot-polyglot directory and save the file as .env.

Your ISY will be discovered, but you will have to go to the settings page and enter your ISY username and password.

Enjoy!
