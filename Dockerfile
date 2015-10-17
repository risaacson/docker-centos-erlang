FROM centos:7

MAINTAINER Richard Isaacson <richard.c.isaacson@gmail.com>

RUN yum install -y \
    gcc \
    glibc-devel \
    make \
    ncurses-devel \
    openssl-devel \
    autoconf

ENV OTP_VERSION 18.1

ADD http://erlang.org/download/otp_src_${OTP_VERSION}.tar.gz /usr/src/

RUN cd /usr/src \
    && tar xf otp_src_${OTP_VERSION}.tar.gz \
    && cd otp_src_${OTP_VERSION} \
    && ./configure \
    && make \
    && make install \
    && cd / && rm -rf /usr/src/otp_src_${OTP_VERSION}

CMD ["erl"]
