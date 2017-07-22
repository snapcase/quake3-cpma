# Quake3 CPMA Server on Alpine Linux

CPMA container based on the [jberrenberg/quake3](https://hub.docker.com/r/jberrenberg/quake3/) image.

## Setup
Start up a data volume for configs and maps:

```bash
docker run --entrypoint=/bin/sh -v /home/ioq3srv/ioquake3/cpma --name cpma-data snapcase/quake3-cpma
```

Copy your `server.cfg`, `motd.cfg` and maps to the data volume:

```bash
docker cp server.cfg cpma-data:/home/ioq3srv/ioquake3/cpma
docker cp motd.cfg cpma-data:/home/ioq3srv/ioquake3/cpma
docker cp map.pk3 cpma-data:/home/ioq3srv/ioquake3/cpma
```

Start server:

```bash
export PAK0=/path/to/pak0.pk3
docker run -d --rm -v ${PAK0}:/pak0.pk3 \
  --volumes-from cpma-data \
  -p 0.0.0.0:27960:27960/udp \
  snapcase/quake3-cpma +set sv_hostname "my cpma server"
```
