FROM centos:centos7
COPY ./security.conf ./unicode.mapping ./modsecurity.conf ./nginx.conf ./docker-entrypoint.sh /
RUN yum -y install https://repo.aerisnetwork.com/pub/aeris-release-7.rpm && sed -i 's/check=1/check=0/g' /etc/yum.repos.d/epel.repo \
	&& yum install -y nginx-more nginx-more-module-modsecurity \
	&& yum install -y wget && wget https://github.com/coreruleset/coreruleset/archive/refs/tags/v3.3.2.tar.gz \
	&& mkdir /usr/local/coreruleset && tar -xvf ./v3.3.2.tar.gz --strip-components 1 -C /usr/local/coreruleset && rm -rf ./v3.3.2.tar.gz \
	&& mv /nginx.conf /security.conf /modsecurity.conf /unicode.mapping /etc/nginx/ \
	&& yum remove -y wget && yum clean all && rm -rf  /var/cache/* && rm -rf /tmp
ENTRYPOINT ["/docker-entrypoint.sh"]
