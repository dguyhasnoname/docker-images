FROM alpine:3.10
RUN apk add --no-cache \
          bash \
          gettext \
          git \
          jq \
          bind-tools \
          curl \
          openssh-client \
          tree \ 
          terraform

ARG HELM_VERSION=3.1.2
ARG KUBECTL_VERSION=1.18.0
ARG VAULT_VERSION=1.3.2
ARG YAML_BIN_VERSION=3.3.0

# Install helm (latest release)
ENV BASE_URL="https://storage.googleapis.com/kubernetes-helm"
ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"
RUN apk add --update --no-cache ca-certificates  && \
    curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    rm -f /var/cache/apk/*

## Install yq
RUN wget -O /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YAML_BIN_VERSION}/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq

# Install python 3
ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

# Install kubectl (same version of aws esk)
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

# Install eksctl (latest version)
# RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
#     mv /tmp/eksctl /usr/bin && \
#     chmod +x /usr/bin/eksctl

# Install velero CLI
ARG VELERO_VERSION=1.3.2
RUN curl -L https://github.com/vmware-tanzu/velero/releases/download/v${VELERO_VERSION}/velero-v${VELERO_VERSION}-linux-amd64.tar.gz | tar xvz && \
    mv velero-v1.3.2-linux-amd64/velero /usr/local/bin/velero && \
    chmod +x /usr/local/bin/velero && \
    rm -rf velero-v1.3.2-linux-amd64 
    
# Install vault
ARG VAULT_VERSION=1.4.1
RUN apk --update --no-cache add tini libcap openssl net-tools
RUN curl -sSLo /tmp/vault.zip https://releases.hashicorp.com/vault/$VAULT_VERSION/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip -d /usr/bin/ /tmp/vault.zip && \
    rm -rf /tmp/vault.zip && \
    chmod +x /usr/bin/vault

# fetch scripts for alias
WORKDIR /workdir
COPY login.txt /login.txt
RUN git init && git clone https://github.com/dguyhasnoname/k8s-day2-ops.git \
    && cd k8s-day2-ops && git pull
COPY .bash_profile /workdir/.bash_profile
RUN cat /workdir/.bash_profile >> ~/.bashrc