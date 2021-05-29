FROM ubuntu:20.04

ENV FILEBOT_VERSION 4.9.3 BETA R8579

RUN apt-get update \
 && apt-get install -y default-jre-headless libjna-java mediainfo libchromaprint-tools unrar p7zip-full p7zip-rar mkvtoolnix atomicparsley gnupg curl file inotify-tools \
 && rm -rvf /var/lib/apt/lists/*

RUN wget https://get.filebot.net/filebot/BETA/FileBot_4.9.3_universal.deb \
 && dpkg -i FileBot_4.9.3_universal.deb \
 && rm -rf FileBot_4.9.3_universal.deb

ENV HOME /data
ENV LANG C.UTF-8
ENV FILEBOT_OPTS "-Dapplication.deployment=docker -Duser.home=$HOME"


ENTRYPOINT ["filebot"]
