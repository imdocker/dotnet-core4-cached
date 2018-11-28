FROM imdocker1/dotnet-core4
# Build from
# https://github.com/imdocker/dotnet-core4

ENV IMAGE_DATE 2018-11-28
ENV IMAGE_NUM 005a

ENV RELEASE_HASH=14f6dfeea4041cd30dab36537b03c6383639d575738a53359b45ff20c72bef37
ENV RELEASE_FILE=nuget1.tar.gz
ENV RELEASE_VERSION=0.0.4

 #Use with dotnet-core4cache
 #https://github.com/imdocker/dotnet-core4cache

RUN dnf update -y && dnf install wget -y && \
  set -ex \
  && cd /root && wget --quiet https://github.com/imdocker/dotnet-core4cache/releases/download/${RELEASE_VERSION}/${RELEASE_FILE} -O nuget.tar.gz \
  && echo "${RELEASE_HASH}  nuget.tar.gz" | sha256sum -c \
  && tar -xf nuget.tar.gz && rm nuget.tar.gz && dnf clean all
