FROM centos:7
ENV KUBECONFIG=/etc/kubernetes/admin.conf
WORKDIR /
ADD kubernetes.repo /etc/yum.repos.d/kubernetes.repo
RUN yum install -y ca-certificates git which kubectl gcc gcc-c++.x86_64 boost-devel.x86_64 zlib-devel openssl-devel libcurl-devel subversion.x86_64 openssl which
RUN yum clean all && rm -rf /var/cache/yum
RUN curl -s https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | sh
RUN mkdir /root/.kube
RUN curl -s -O http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/y/yaml-cpp-0.5.1-1.el7.2.x86_64.rpm
RUN yum install -y yaml-cpp-0.5.1-1.el7.2.x86_64.rpm
RUN curl -s -O http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/y/yaml-cpp-devel-0.5.1-1.el7.2.x86_64.rpm
RUN yum install -y yaml-cpp-devel-0.5.1-1.el7.2.x86_64.rpm
RUN curl -s -O https://jenkins.slateci.io/artifacts/client/slate-linux.tar.gz
RUN tar xzf slate-linux.tar.gz && chmod +x slate && mv slate /usr/bin/ && rm slate-linux.tar.gz
