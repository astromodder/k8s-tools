ARG BASE_IMAGE="rockylinux"
ARG BASE_TAG="9"

FROM ${BASE_IMAGE}:${BASE_TAG}

COPY packages.txt /tmp/packages.txt
ARG PACKAGES=$(cat /tmp/packages.txt | tr "\n" " ")

RUN dnf -y update \
    && dnf -y install epel-release yum-utils \
    && yum-config-manager --enable epel \
    && dnf install -y --setopt=install_weak_deps=False --allowerasing $PACKAGES \
    && dnf clean all \
    && rm -rf /var/cache/dnf

ENTRYPOINT ["tail", "-f", "/dev/null"]
