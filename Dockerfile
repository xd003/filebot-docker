FROM ubuntu:20.04

ENV FILEBOT_VERSION 4.9.3 # ( BETA r8580 )

RUN apt-get update \
 && apt-get install -y default-jre-headless libjna-java mediainfo libchromaprint-tools unrar p7zip-full p7zip-rar mkvtoolnix atomicparsley gnupg curl file inotify-tools wget \
 && rm -rvf /var/lib/apt/lists/*

RUN wget https://get.filebot.net/filebot/BETA/FileBot_4.9.3_universal.deb \
 && dpkg -i FileBot_4.9.3_universal.deb \
 && rm -rf FileBot_4.9.3_universal.deb \
 && export JAVA_OPTS="-Xmx1g"

ENV HOME /data
ENV LANG C.UTF-8
ENV FILEBOT_OPTS "-Dapplication.deployment=docker -Duser.home=$HOME"


ENTRYPOINT ["filebot"]
