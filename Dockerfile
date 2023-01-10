FROM centos:centos7
RUN yum -y install https://repo.aerisnetwork.com/pub/aeris-release-7.rpm \
  && sed -i 's/check=1/check=0/g' /etc/yum.repos.d/epel.repo \
  && yum install -y nginx-more nginx-more-module-modsecurity \
  && yum install -y wget \
  && wget https://github.com/coreruleset/coreruleset/archive/refs/tags/v3.3.2.tar.gz \
  && mkdir /usr/local/coreruleset \
  && tar -xvf ./v3.3.2.tar.gz --strip-components 1 -C /usr/local/coreruleset \
  && rm -rf ./v3.3.2.tar.gz \
  && yum remove -y wget \
  && yum clean all \
  && rm -rf  /var/cache/* \
  && rm -rf /tmp
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
