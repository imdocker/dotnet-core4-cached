FROM imdocker1/dotnet-core4
# Build from
# https://github.com/imdocker/dotnet-core4

ENV IMAGE_DATE 2018-12-04
ENV IMAGE_NUM 005b

ENV RELEASE_HASH=99be0151749b7b811db6d041753bbe5eeb64f275862c4c5c60c0be91b5a0ef50
ENV RELEASE_FILE=nuget2.tar.gz
ENV RELEASE_VERSION=0.0.4

 #Use with dotnet-core4cache
 #https://github.com/imdocker/dotnet-core4cache

RUN dnf update -y && dnf install wget -y && \
  set -ex \
  && cd /root && wget --quiet https://github.com/imdocker/dotnet-core4cache/releases/download/${RELEASE_VERSION}/${RELEASE_FILE} -O nuget.tar.gz \
  && echo "${RELEASE_HASH}  nuget.tar.gz" | sha256sum -c \
  && tar -xf nuget.tar.gz && rm nuget.tar.gz && dnf clean all
