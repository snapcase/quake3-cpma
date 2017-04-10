FROM jberrenberg/quake3:latest

LABEL maintainer "snapcase"

RUN \
  wget http://playmorepromode.org/CPMA148.zip -O /tmp/CPMA148.zip && \
  unzip /tmp/CPMA148.zip -d ~/ioquake3 && \
  rm /tmp/CPMA148.zip

ENTRYPOINT ["/home/ioq3srv/ioquake3/ioq3ded.x86_64", "+set", "dedicated", "2", "+set", "fs_game", "cpma"]
