FROM ubuntu:20.04

LABEL   maintainer="Pascal Watteel" \
        name="jenkins-dind" \
        version="1.0"

#set env variables
ENV DEBIAN_FRONTEND noninteractive

# Requirements
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y   default-jre \
                        wget \
                        curl \
                        python3-pip \
                        jq \
                        unzip \
                        git \
                        apt-transport-https \
                        ca-certificates \
                        curl \
                        gnupg-agent \
                        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" \
    && apt-get update -y \
    && apt-get install -y docker-ce-cli \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*