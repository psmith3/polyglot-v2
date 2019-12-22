# UDI Polyglot v2 for Docker on Synology

Polyglot is a Middleware between the [Universal Devices ISY Home Automation device](http://www.universal-devices.com/) and any number of external devices and services. 

This repository provides the necessary requirments to run the latest UDI Polyglot-v2 build in Docker running on a Synology NAS. I specifically run a DS1815+. It uses the node:10-alpine container from the original polyglot-v2 dockerfile at https://github.com/UniversalDevicesInc/polyglot-v2/tree/master/docker 

To clone this repository, you will need git installed. Log onto your Synology NAS and install the Git Server Package from the Package Store.

This installation will create docker containers for polyglot-v2 and mongo. Local volumes will be created for the polyglot-v2 configuration and mongo database and will be persistant across reboots. Both containers use the docker host network so that polyglot will find your ISY and nodeservers will auto discover local devices in the network.

### Installation instructions

1) ssh into your NAS.

2) Enter
		cd volume1/docker/
3) Enter
		sudo git clone https://github.com/psmith3/polyglot-v2.git

4) Enter your admin Password: 

			Cloning into 'polyglot-v2'...
			remote: Enumerating objects: 74, done.
			remote: Counting objects: 100% (74/74), done.
			remote: Compressing objects: 100% (72/72), done.
			remote: Total 3886 (delta 37), reused 0 (delta 0), pack-reused 3812
			Receiving objects: 100% (3886/3886), 264.37 MiB | 26.46 MiB/s, done.
			Resolving deltas: 100% (2305/2305), done.

5) Enter

		cd polyglot-v2/
		./install.sh 

			Installing latest polyglot-v2 with mongo...
			Running docker-compose up...
			Pulling mongo (mongo:latest)...
			latest: Pulling from library/mongo
			Status: Downloaded newer image for mongo:latest
			Building polyglot
			Step 1/7 : FROM node:10-alpine
			10-alpine: Pulling from library/node
			Status: Downloaded newer image for node:10-alpine
			Step 2/7 : EXPOSE 3000
			Step 3/7 : WORKDIR /opt/polyglot-v2/
			Step 4/7 : RUN	apk add --no-cache linux-headers build-base && 		apk add --no-cache python3 python3-dev py3-pip bash git ca-certificates wget tzdata openssl &&     python3 -m ensurepip &&     rm -r /usr/lib/python*/ensurepip &&     pip3 install --upgrade pip setuptools &&     if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi &&     rm -r /root/.cache &&     cd /opt &&     git clone --depth=1 --single-branch --branch master https://github.com/UniversalDevicesInc/polyglot-v2.git &&     cd /opt/polyglot-v2 && 	npm install mongoose@5.8.2 && 		npm audit fix && 		npm install
			fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/main/x86_64/APKINDEX.tar.gz
			fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/community/x86_64/APKINDEX.tar.gz
			(1/17) Installing binutils (2.33.1-r0)
			(2/17) Installing libmagic (5.37-r1)
			(3/17) Installing file (5.37-r1)
			(4/17) Installing gmp (6.1.2-r1)
			(5/17) Installing isl (0.18-r0)
			(6/17) Installing libgomp (9.2.0-r3)
			(7/17) Installing libatomic (9.2.0-r3)
			(8/17) Installing mpfr4 (4.0.2-r1)
			(9/17) Installing mpc1 (1.1.0-r1)
			(10/17) Installing gcc (9.2.0-r3)
			(11/17) Installing musl-dev (1.1.24-r0)
			(12/17) Installing libc-dev (0.7.2-r0)
			(13/17) Installing g++ (9.2.0-r3)
			(14/17) Installing make (4.2.1-r2)
			(15/17) Installing fortify-headers (1.1-r0)
			(16/17) Installing build-base (0.5-r1)
			(17/17) Installing linux-headers (4.19.36-r0)
			Executing busybox-1.31.1-r8.trigger
			OK: 183 MiB in 33 packages
			fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/main/x86_64/APKINDEX.tar.gz
			fetch http://dl-cdn.alpinelinux.org/alpine/v3.11/community/x86_64/APKINDEX.tar.gz
			(1/22) Installing ncurses-terminfo-base (6.1_p20191130-r0)
			(2/22) Installing ncurses-terminfo (6.1_p20191130-r0)
			(3/22) Installing ncurses-libs (6.1_p20191130-r0)
			(4/22) Installing readline (8.0.1-r0)
			(5/22) Installing bash (5.0.11-r1)
			Executing bash-5.0.11-r1.post-install
			(6/22) Installing ca-certificates (20191127-r0)
			(7/22) Installing nghttp2-libs (1.40.0-r0)
			(8/22) Installing libcurl (7.67.0-r0)
			(9/22) Installing expat (2.2.9-r0)
			(10/22) Installing pcre2 (10.34-r1)
			(11/22) Installing git (2.24.1-r0)
			(12/22) Installing openssl (1.1.1d-r2)
			(13/22) Installing libbz2 (1.0.8-r1)
			(14/22) Installing libffi (3.2.1-r6)
			(15/22) Installing gdbm (1.13-r1)
			(16/22) Installing xz-libs (5.2.4-r0)
			(17/22) Installing sqlite-libs (3.30.1-r1)
			(18/22) Installing python3 (3.8.0-r0)
			(19/22) Installing pkgconf (1.6.3-r0)
			(20/22) Installing python3-dev (3.8.0-r0)
			(21/22) Installing tzdata (2019c-r0)
			(22/22) Installing wget (1.20.3-r0)
			Executing busybox-1.31.1-r8.trigger
			Executing ca-certificates-20191127-r0.trigger
			OK: 316 MiB in 55 packages
			Looking in links: /tmp/tmp3yi5vx95
			Requirement already satisfied: setuptools in /usr/lib/python3.8/site-packages (41.2.0)
			Requirement already satisfied: pip in /usr/lib/python3.8/site-packages (19.2.3)
			Collecting pip
 			 Downloading https://files.pythonhosted.org/packages/00/b6/9cfa56b4081ad13874b0c6f96af8ce16cfbc1cb06bedf8e9164ce5551ec1/pip-19.3.1-py2.py3-none-any.whl (1.4MB)
			Collecting setuptools
 			 Downloading https://files.pythonhosted.org/packages/54/28/c45d8b54c1339f9644b87663945e54a8503cfef59cf0f65b3ff5dd17cf64/setuptools-42.0.2-py2.py3-none-any.whl (583kB)
			Installing collected packages: pip, setuptools
  			Found existing installation: pip 19.2.3
    			Uninstalling pip-19.2.3:
			Successfully uninstalled pip-19.2.3
 			 Found existing installation: setuptools 41.2.0
    			Uninstalling setuptools-41.2.0:
      			Successfully uninstalled setuptools-41.2.0
			Successfully installed pip-19.3.1 setuptools-42.0.2
			Cloning into 'polyglot-v2'...
				+ mongoose@5.8.2
			added 1006 packages from 1107 contributors and audited 14369 packages in 41.554s

			1 package is looking for funding
 			 run `npm fund` for details

			found 35 vulnerabilities (14 low, 21 high)
 			 run `npm audit fix` to fix them, or `npm audit` for details
				+ express-fileupload@1.1.6
				+ npm@6.13.4
			added 6 packages from 3 contributors, removed 4 packages and updated 29 packages in 29.296s

			1 package is looking for funding
 			 run `npm fund` for details

			fixed 15 of 35 vulnerabilities in 14369 scanned packages
			  20 vulnerabilities required manual review and could not be updated
			audited 14307 packages in 17.862s

			1 package is looking for funding
			  run `npm fund` for details

			found 1 low severity vulnerability
			  run `npm audit fix` to fix them, or `npm audit` for details
			Removing intermediate container 8772ea7ab4b2
		Step 5/7 : VOLUME /root/.polyglot
		Step 6/7 : VOLUME /usr/lib/python3.8/site-packages
		Step 7/7 : CMD npm start
			Creating mongodb ... done
			Creating polyglotv2 ... done
			Creating SSL certs & stopping containers...
			Stop running containers without removing them.
			Starting containers...
			mongodb is up-to-date
			polyglotv2 is up-to-date
		Done. Polyglot v2 should now be running in Docker. Access via webbrowser at https://{docker ip address}:3000

		
Your browser may not allow you to view the webpage because the ssl certs are not signed. You can allow this with Safari on Mac or you can open a private browser window and access. You can overide the use https setting in the ./dot-polyglot/.env file to overcome this, but you will have to manually edit each node server in the ISY and uncheck SSL. If required, edit the .env.example file in the ./dot-polyglot directory and save the file as .env.

Your ISY will be discovered, but you will have to go to the settings page and enter your ISY username and password.

Thanks to einstein.42 for his original work. 

Enjoy!
