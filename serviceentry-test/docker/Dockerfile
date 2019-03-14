FROM centos:centos7

LABEL maintainer="xavier@canal.cat"

ENV STALKER_HOME=/opt/stalker \
    PATH=$STALKER_HOME:$PATH

WORKDIR $STALKER_HOME

COPY stalk-it.sh $STALKER_HOME/

CMD ["/opt/stalker/stalk-it.sh"]
