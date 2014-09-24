# Information Of Package
PKG_ALIAS=go
PKG_VERSION=go-1.3.1
PKG_PACKAGE=go1.3.1.linux-amd64.tar.gz
PKG_LINK=https://storage.googleapis.com/golang/$PKG_PACKAGE

# Go
cd /tmp && \
curl -O -L $PKG_LINK && \
tar -zxf /tmp/$PKG_PACKAGE && \
mv /tmp/go /usr/local/$PKG_VERSION && \
ln -s /usr/local/$PKG_VERSION /usr/local/$PKG_ALIAS

# Clean up system
rm -rf /tmp/* /var/tmp/*
