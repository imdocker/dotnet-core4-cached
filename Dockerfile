FROM quay.io/imdocker1/dotnet-core4
# Build from
# https://github.com/imdocker/dotnet-core4

ENV IMAGE_DATE 2019-05-15
ENV IMAGE_NUM 009

ENV RELEASE_HASH=8431b4e0ebe1507dcdfb5ac13d55c1fb3f53d45cf5c678a4a077d5ac2c2f4e59
ENV RELEASE_FILE=cache-2-2-204-fedora30.tar.gz
ENV RELEASE_VERSION=0.0.9

 #Use with dotnet-core4cache
 #https://github.com/imdocker/dotnet-core4cache

RUN dnf update -y && dnf install wget -y && \
  set -ex \
  && cd /root && wget --quiet https://github.com/imdocker/dotnet-core4-cached/releases/download/${RELEASE_VERSION}/${RELEASE_FILE} -O nuget.tar.gz \
  && echo "${RELEASE_HASH}  nuget.tar.gz" | sha256sum -c \
  && tar -xf nuget.tar.gz && rm nuget.tar.gz && dnf clean all
