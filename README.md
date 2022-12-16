# Project Goal
* providing a common dev environment for different OS/SDKs
  * switching between different version of OS
  * switching between different version of SDKs(java, python ...)
* saving personal settings for quick recovery

* customizable
  * add personal settings, favorite libraries ...
* extendable
  * please add something can benefit the whole team
    * common settings(bastion hosts, scylla pool cluster settings ... ) 
    * libraries

# Commands
* build.sh 
  * build environment in to docker image
* restart.sh
  * run docker container, it will stop and remove the old running container
* login.sh
  * login to current running container
* save.sh
  * save current running docker image to local file,
  * can be backed up to safe place for recovering
* load.sh
  * load docker image

# Docker images
* paraverse-base
  * include all basic libraries for development
* paraverse-personal
  * include personal settings
