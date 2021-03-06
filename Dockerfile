FROM alpine:3.8

ENV JAVA_HOME="/jdk-11"
ARG JDK_BUILD="28"
ENV JDK_ARCHIVE="openjdk-11+${JDK_BUILD}_linux-x64-musl_bin.tar.gz"

RUN wget https://download.java.net/java/early_access/alpine/${JDK_BUILD}/binaries/${JDK_ARCHIVE}

RUN wget https://download.java.net/java/early_access/alpine/${JDK_BUILD}/binaries/${JDK_ARCHIVE}.sha256

RUN tar -xzf ${JDK_ARCHIVE}
RUN rm ${JDK_ARCHIVE} ${JDK_ARCHIVE}.sha256 
RUN rm ${JAVA_HOME}/lib/src.zip

ENV PATH=$PATH:${JAVA_HOME}/bin

ENV JAVA_VERSION 11-ea+${JDK_BUILD}
ENV JAVA_ALPINE_VERSION 11~${JDK_BUILD}-1