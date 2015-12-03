# Dockerfile-Openfire

Openfire is a real time collaboration (RTC) server licensed under the Open Source Apache License. 
It uses the only widely adopted open protocol for instant messaging, XMPP (also called Jabber).
Openfire is incredibly easy to setup and administer, but offers rock-solid security and performance.

## How-to-run
Simply bind a port and run as a container.

```sh
docker run -d --name openfire -p 9090:9090 openfire
```
Start service

```sh
docker exec -it <OPENFIRE_CONTAINER_ID> /start.sh
```
Open your web broswer and check **localhost:9090** to see if it is running.

## Contact
Email me:
zyfdegg@gmail.com

