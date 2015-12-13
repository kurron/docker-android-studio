FROM kurron/docker-jetbrains-base:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

LABEL org.kurron.ide.name="Android Studio" org.kurron.ide.version=1.5.1.0

RUN apt-get update && \
    apt-get install -y unzip lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6 && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD https://dl.google.com/dl/android/studio/ide-zips/1.5.1.0/android-studio-ide-141.2456560-linux.zip /tmp/ide.zip

RUN mkdir -p /opt/ide && \
    unzip /tmp/ide.zip -d /opt/ide && \
    rm /tmp/ide.zip

ENV STUDIO_JDK=/usr/lib/jvm/oracle-jdk-8

USER developer:developer
WORKDIR /home/developer
ENTRYPOINT ["/opt/ide/android-studio/bin/studio.sh"]
