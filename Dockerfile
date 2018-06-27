FROM anapsix/alpine-java

RUN apk update && apk add wget sudo libxext libxrender libxtst libxi && \
    mkdir -p /home/developer

ADD ksar.jar /home/developer/ksar.jar
ADD sa /home/developer/sa

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD ["java", "-jar", "ksar.jar"]
