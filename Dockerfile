FROM ubuntu:latest

# https://github.com/ToyoDAdoubi/doubi
# https://github.com/ToyoDAdoubiBackup/shadowsocksr
# https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh
# https://github.com/Alvin9999/new-pac/wiki/自建ss服务器教程

LABEL maintainer="51pwn.com<s1pwned@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update

# https://github.com/sjdy521/Mojo-Webqq/issues/62
ENV TZ=Asia/Shanghai
RUN echo $TZ > /etc/timezone && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
# /usr/share/zoneinfo/Asia/Shanghai

RUN apt-get install -y --assume-yes --no-install-recommends apt-utils wget  iptables && apt-get upgrade -y -o Dpkg::Options::="--force-confold" --fix-missing \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY ssr.sh ssr.sh
RUN  chmod +x ssr.sh && bash ssr.sh && rm -rf ssr.sh
	
ENTRYPOINT []

CMD ["/bin/bash"]
