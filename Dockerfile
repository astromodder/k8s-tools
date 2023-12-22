ARG BASE_IMAGE="rockylinux"
ARG BASE_TAG="9"

FROM ${BASE_IMAGE}:${BASE_TAG}

COPY packages.txt /tmp/packages.txt

RUN dnf -y update \
    && dnf -y install epel-release yum-utils \
    && yum-config-manager --enable epel \
    && dnf install -y --setopt=install_weak_deps=False --allowerasing $(cat /tmp/packages.txt | tr "\n" " ") \
    && dnf clean all \
    && rm -rf /var/cache/dnf /tmp/packages.txt

ENTRYPOINT ["tail", "-f", "/dev/null"]
