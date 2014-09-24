# VERSION 1.1
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Devbase-go Image Container

FROM dockerbase/devbase

# Run dockerbase script
ADD     go.sh /dockerbase/
RUN     /dockerbase/go.sh

ENV     GOROOT /usr/local/go
ENV     PATH $PATH:$GOROOT/bin

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
