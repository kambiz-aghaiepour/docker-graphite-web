FROM centos
    
# Setup repos 
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    
# Install packages
RUN yum clean all && yum install -y httpd || true
RUN yum clean all && yum install -y graphite-web expect && yum clean all
COPY setup-graphite-db.exp /root/setup-graphite-db.exp
RUN chmod 755 /root/setup-graphite-db.exp && /root/setup-graphite-db.exp root calvin

# ensure ownership is correct
RUN chown apache:apache /var/lib/graphite-web/graphite.db

COPY graphite-web.conf /etc/httpd/conf.d/graphite-web.conf
RUN rm -f /etc/httpd/conf.d/welcome.conf

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]

