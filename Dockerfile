FROM imdocker1/dotnet-core4:009
# Build from
# https://github.com/imdocker/dotnet-core4

ENV IMAGE_DATE 2018-03-12
ENV IMAGE_NUM 009

ENV RELEASE_HASH=620a1fb4b8f8344b2f4578b57a30f8e5d378925db588830f861050070bf086bc
ENV RELEASE_FILE=nuget2.2.104.tar.gz
ENV RELEASE_VERSION=0.0.6

 #Use with dotnet-core4cache
 #https://github.com/imdocker/dotnet-core4cache

RUN dnf update -y && dnf install wget -y && \
  set -ex \
  && cd /root && wget --quiet https://github.com/imdocker/dotnet-core4cache/releases/download/${RELEASE_VERSION}/${RELEASE_FILE} -O nuget.tar.gz \
  && echo "${RELEASE_HASH}  nuget.tar.gz" | sha256sum -c \
  && tar -xf nuget.tar.gz && rm nuget.tar.gz && dnf clean all
