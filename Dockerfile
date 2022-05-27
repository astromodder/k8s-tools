# syntax=docker/dockerfile:1

FROM rockylinux:8

RUN dnf -y install epel-release yum-utils

RUN yum-config-manager --enable epel powertools

RUN dnf -y install wget curl sudo redis vim-enhanced nmap net-tools bind-utils

RUN dnf install -y --nogpgcheck https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN dnf -qy --nogpgcheck module disable postgresql
RUN dnf install -y --nogpgcheck postgresql14
RUN yum-config-manager --disable pgdg*

ENTRYPOINT ["tail", "-f", "/dev/null"]
