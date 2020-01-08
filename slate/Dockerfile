FROM arm64v8/centos:latest

ENV KUBECONFIG=/etc/k3s.yaml

WORKDIR /src

COPY kubernetes.repo /etc/yum.repos.d/kubernetes.repo
COPY slate-server.repo /etc/yum.repos.d/slate-server.repo
RUN yum install -y ca-certificates git vim which kubectl boost zlib openssl libcurl openssl
RUN yum clean all && rm -rf /var/cache/yum

RUN curl -LO https://get.helm.sh/helm-v3.0.2-linux-arm64.tar.gz
RUN tar -xzf helm-v3.0.2-linux-arm64.tar.gz && mv linux-arm64/helm /usr/local/bin/helm

RUN mkdir /root/.kube

RUN curl -s -O https://dl.fedoraproject.org/pub/epel/7/aarch64/Packages/y/yaml-cpp-0.5.1-2.el7.aarch64.rpm
RUN yum install -y yaml-cpp-0.5.1-2.el7.aarch64.rpm

RUN yum install -y gcc-c++ openssl-devel libcurl-devel zlib-devel epel-release && yum install -y cmake3 boost-devel yaml-cpp-devel
RUN git clone https://github.com/slateci/slate-client-server.git
WORKDIR /src/slate-client-server
RUN mkdir build
WORKDIR /src/slate-client-server/build
RUN cmake3 .. -DBUILD_CLIENT=True -DBUILD_SERVER=False -DBUILD_SERVER_TESTS=False
RUN make
RUN mv slate /usr/bin/slate


WORKDIR /
COPY init.sh .
RUN chmod +x init.sh
