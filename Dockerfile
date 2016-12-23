# s2i-test
# Here you can use whatever image base is relevant for your application.
FROM ubuntu:latest

# Here you can specify the maintainer for the image that you're building
MAINTAINER Singhamxiao <yuan.xiao5@zte.com.cn>

# Export the environment variable that provides information about the application.
# Replace this with the according version for your application.
ENV TEST_APP_VERSION=1.0

# Set labels used in OpenShift to describe the builder image
#LABEL io.k8s.description="Platform for building xyz" \
#      io.k8s.display-name="builder x.y.z" \
#      io.openshift.expose-services="8080:http" \
#      io.openshift.tags="builder,x.y.z,etc." \
#      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

LABEL io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"
# LABEL io.openshift.s2i.destination="image:///opt/app"

# Install build-essential.
# RUN apt-get update && apt-get install -y g++ && apt-get -y clean

# Copy the S2I scripts to /usr/libexec/s2i since we set the label that way
COPY ./src/.s2i/bin/usage /usr/libexec/s2i/

# Set the default CMD for the image
CMD /usr/libexec/s2i/usage