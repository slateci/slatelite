FROM centos:7

ENV KUBECONFIG=/etc/rancher/k3s/k3s.yaml

WORKDIR /src

COPY kubernetes.repo /etc/yum.repos.d/kubernetes.repo
COPY slate-server.repo /etc/yum.repos.d/slate-server.repo
RUN yum install -y ca-certificates git vim which kubectl boost zlib openssl libcurl openssl
RUN yum clean all && rm -rf /var/cache/yum

RUN curl -LO https://get.helm.sh/helm-v3.0.2-linux-arm64.tar.gz
RUN tar -xzf helm-v3.0.2-linux-arm64.tar.gz && mv linux-arm64/helm /usr/local/bin/helm

RUN mkdir /root/.kube

RUN curl -s -O http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/y/yaml-cpp-0.5.1-1.el7.2.x86_64.rpm
RUN yum install -y yaml-cpp-0.5.1-1.el7.2.x86_64.rpm

RUN curl -s -O https://jenkins.slateci.io/artifacts/client/slate-linux.tar.gz
RUN tar xzf slate-linux.tar.gz && chmod +x slate && mv slate /usr/bin/

WORKDIR /
COPY init.sh .
RUN chmod +x init.sh
