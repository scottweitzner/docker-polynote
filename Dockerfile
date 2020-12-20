FROM python:3.7.9-slim-buster AS base

MAINTAINER scottweitzner@gmail.com
LABEL description="a docker image for polynote, Netflix's opensource alternative to jupyterlab"

RUN apt-get update \
    && apt-get --yes --no-install-recommends install \
    wget

ARG POLYNOTE_VERSION=0.3.12
RUN wget -O polynote.tar.gz "https://github.com/polynote/polynote/releases/download/${POLYNOTE_VERSION}/polynote-dist.tar.gz"
RUN tar -zxvpf polynote.tar.gz

FROM python:3.7.9-slim-buster
COPY --from=base /polynote /usr/local/polynote

RUN mkdir -p /usr/share/man/man1
RUN apt-get update \
    && apt-get --yes --no-install-recommends install \
    default-jdk \
    build-essential

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

WORKDIR /usr/local/polynote
COPY config.yml .
RUN pip install -r requirements.txt

RUN mkdir -p /polynote-user/notebooks
RUN chmod -R 755 /polynote-user/notebooks

EXPOSE 8192
ENTRYPOINT ["./polynote.py"]