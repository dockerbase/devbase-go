# VERSION 1.0
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Devbase-go Image Container

FROM dockerbase/devbase

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

# Information Of Package
ENV     PKG_ALIAS   go
ENV	PKG_VERSION go-1.3.1
ENV	PKG_PACKAGE go1.3.1.linux-amd64.tar.gz
ENV	PKG_LINK https://storage.googleapis.com/golang/$PKG_PACKAGE

USER    root
# Go
RUN     cd /tmp && \
        curl -O -L $PKG_LINK && \
        tar -zxf /tmp/$PKG_PACKAGE && \
        mv /tmp/go /usr/local/$PKG_VERSION && \
        ln -s /usr/local/$PKG_VERSION /usr/local/$PKG_ALIAS

ENV     GOROOT /usr/local/$PKG_ALIAS
ENV     PATH $PATH:$GOROOT/bin

# Clean up system
RUN     rm -rf /tmp/* /var/tmp/*

USER    devbase

# Set environment variables.
ENV     HOME /home/devbase

# Define working directory.
WORKDIR /home/devbase

# Setup GOPATH environment.
RUN     mkdir -p $HOME/go
ENV     GOPATH $HOME/go
ENV     PATH $PATH:$GOPATH/bin

# Append User Guide.
ADD     build/userguide.md $HOME/UserGuide.md

# Define default command.
CMD ["bash"]
