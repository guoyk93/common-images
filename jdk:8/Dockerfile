FROM guoyk/common-ubuntu:20.04

RUN curl -sSLo openjdk.tar.gz 'https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u252-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u252b09.tar.gz' && \
    mkdir -p /opt/jdk && \
    tar -C /opt/jdk --strip-components 1 -xf openjdk.tar.gz && \
    rm -f openjdk.tar.gz && \
    curl -sSLo arthas.deb 'https://github.com/alibaba/arthas/releases/download/arthas-all-3.3.3/arthas-3.3.3.deb' && \
    dpkg -i arthas.deb && \
    rm -rf arthas.deb

ENV JRE_HOME  /opt/jdk
ENV JDK_HOME  /opt/jdk
ENV JAVA_HOME /opt/jdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"

ENV JAVA_XMS "128m"
ENV JAVA_XMX "1500m"
ENV JAVA_OPTS "-server -Djava.security.egd=file:/dev/./urandom"

ADD scripts /opt/bin
