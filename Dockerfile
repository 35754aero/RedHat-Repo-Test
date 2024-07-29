FROM registry.access.redhat.com/ubi8/ubi:latest

RUN subscription-manager register --username ${username} --password ${password} --auto-attach

RUN yum -y update && \
    yum -y install yum-utils createrepo

RUN mkdir -p /mnt/repos

COPY sync_repos.sh /usr/local/bin/sync_repos.sh
RUN chmod +x /usr/local/bin/sync_repos.sh

WORKDIR /mnt/repos

ENTRYPOINT ["/usr/local/bin/sync_repos.sh"]
