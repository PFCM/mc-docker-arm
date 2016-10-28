# docker image for running minecraft on rpi and friends
FROM  armbuild/debian

MAINTAINER pfcm

ENV   DEBIAN_FRONTEND noninteractive

# install stuff
RUN   apt-get -y update; apt-get -y upgrade;
RUN   sudo apt-add-repository -y ppa:webupd8team/java; apt-get -y update
RUN   echo debconf shared/accepted-oracle-license-v1-1 select try | debconf-set-selections && \
      echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
      apt-get -y install curl oracle-java8-installer; apt-get clean

ADD   ./scripts/start.sh /start
RUN   chmod +x /start

EXPOSE 25565
VOLUME ["/data"]

CMD ["/start"]
