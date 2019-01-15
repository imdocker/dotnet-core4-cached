FROM imdocker1/dotnet-core4:007
# Build from
# https://github.com/imdocker/dotnet-core4

ENV IMAGE_DATE 2018-01-15
ENV IMAGE_NUM 007

ENV RELEASE_HASH=c38d3f013c2a166c8d40cee4a592b81e1fac9158c4fc4f13292dd781aadb288c
ENV RELEASE_FILE=nuget2.2.102.tar.gz
ENV RELEASE_VERSION=0.0.6

 #Use with dotnet-core4cache
 #https://github.com/imdocker/dotnet-core4cache

RUN dnf update -y && dnf install wget -y && \
  set -ex \
  && cd /root && wget --quiet https://github.com/imdocker/dotnet-core4cache/releases/download/${RELEASE_VERSION}/${RELEASE_FILE} -O nuget.tar.gz \
  && echo "${RELEASE_HASH}  nuget.tar.gz" | sha256sum -c \
  && tar -xf nuget.tar.gz && rm nuget.tar.gz && dnf clean all
