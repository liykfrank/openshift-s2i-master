#
# s2i-nfe-frontend
#
FROM openshift/base-centos7

# Author
LABEL author="Julio Rivero Mestre <julio.rivero@accelya.com>"

# Builder version
ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="SourceToImage builder for building NFE angular web applications" \
      io.k8s.display-name="NFE angular web application builder 1.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="angular,javascript,builder"

# HOME in base image is /opt/app-root/src
# Install required util packages
RUN yum -y update; \
    yum install tar -y; \
    yum install unzip -y; \
    yum install ca-certificates -y; \
    yum install sudo -y; \
    yum clean all -y

# Install Node.js, create required directories
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs && \
    yum clean all -y && \
    mkdir -p /opt/openshift

# Install http-server
RUN npm install -g http-server

# Install angular
RUN npm install -g @angular/cli

# Drop the root user and make the content of /opt/openshift owned by user 1001
RUN chown -R 1001:1001 /opt/openshift /opt/app-root/src

# Change perms on target/deploy directory to 777
RUN chmod -R 777 /opt/openshift /opt/app-root/src

# Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way.
COPY ./s2i/bin/ /usr/libexec/s2i
RUN chmod -R 777 /usr/libexec/s2i

# This default user is created in the openshift/base-centos7 image
USER 1001

# Set the default port for applications built using this image
EXPOSE 8080

# Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
