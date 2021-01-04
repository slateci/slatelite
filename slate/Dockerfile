FROM centos:7

ENV KUBECONFIG=/etc/kubernetes/admin.conf

WORKDIR /src

COPY kubernetes.repo /etc/yum.repos.d/kubernetes.repo
COPY slate-server.repo /etc/yum.repos.d/slate-server.repo
RUN yum install -y ca-certificates git vim which kubectl boost zlib openssl libcurl openssl
RUN yum clean all && rm -rf /var/cache/yum

RUN curl -s https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | sh

RUN mkdir /root/.kube

RUN curl -s -O https://jenkins.slateci.io/artifacts/client/slate-linux.tar.gz
RUN tar xzf slate-linux.tar.gz && chmod +x slate && mv slate /usr/bin/

WORKDIR /
COPY init.sh .
RUN chmod +x init.sh
