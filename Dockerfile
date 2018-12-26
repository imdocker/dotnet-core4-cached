FROM imdocker1/dotnet-core4:006
# Build from
# https://github.com/imdocker/dotnet-core4

ENV IMAGE_DATE 2018-12-26
ENV IMAGE_NUM 006

ENV RELEASE_HASH=3e079ccb6378b346aa49e8df7253c5009458eefb20bb7be828d760fd33777faa
ENV RELEASE_FILE=nuget.tar.gz
ENV RELEASE_VERSION=0.0.6

 #Use with dotnet-core4cache
 #https://github.com/imdocker/dotnet-core4cache

RUN dnf update -y && dnf install wget -y && \
  set -ex \
  && cd /root && wget --quiet https://github.com/imdocker/dotnet-core4cache/releases/download/${RELEASE_VERSION}/${RELEASE_FILE} -O nuget.tar.gz \
  && echo "${RELEASE_HASH}  nuget.tar.gz" | sha256sum -c \
  && tar -xf nuget.tar.gz && rm nuget.tar.gz && dnf clean all
