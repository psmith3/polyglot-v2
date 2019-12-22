# __Changelog for Polyglot v2 on Synology Docker__

12/22/2019 - Updated to use the dockerfile settings for polyglot version 2.2.8. Refer to issue at https://github.com/UniversalDevicesInc/polyglot-v2/issues/84 for more info. Dockerfile now pulls from node:10-alpine. Addresses a problem with the build-base and linux-headers dependencies were being removed in the current dockerfile and are needed to install Sonos nodeserver using gcc in the install.sh script. Not purging these dependencies does make the polyglot docker image bigger at 458 MB, up from ~280 MB. Added an install of mongoose to clear up a vulnerability and run npm audit fix to further clean up. The polyglot-pkgs volume to /usr/lib/python3.8/site-packages.

The local ISY is actually discovered on the network, but the UI says it was not discovered and the settings still show the default IP of 192.168.1.10. You will need to update the IP address of your ISY and set the username and password. That does seem to be a bug.



12/16/2019 - Changed the build soruce to use python:3.7-slim-buster to reduce the image size from debian:stretch with additional python, node and npm packages installed. Current image size is 678 MB. My goal is to ultimately use node:10-alpine but have not been sucessful getting the extraxted binary file to run in alpine due to the missing and unidenitifed dependencoes. In the current release by UDI for Polyglot-v2, the docker file references node:10-alpine and it does not recognoze the customparamsdoc. In the Tesla nodeserver for example, the customer parameters that show the key fields for username and password never appear. This dockerfile that references python:3.7-slim-buster and installs the binary does not have this issue. I would like to use the node:alpine-10 version due to the smaller size of the package. The problem seems to be something in the git repository. Currently waiting to see if someone from UDI or elsewhere will answer the open issue at https://github.com/UniversalDevicesInc/polyglot-v2/issues/82. 

12/13/2019 - Created repository, some parts forked from UDI Polyglot-v2
