FROM openshift/base-centos7

MAINTAINER Sumit Arrawatia <sumit@quantiply.com>

RUN yum update -y && yum install -y tar wget java-1.8.0-openjdk-headless maven ; yum clean all -y

RUN cd /tmp && \
    git clone https://www.github.com/quantezza/storm && \
    cd storm && git checkout 0.9.3-branch-atdixon && mvn install -DskipTests && \
    cd storm-dist/binary && mvn clean install -Pdist -Dgpg.skip && \
    tar zxf /tmp/storm/storm-dist/binary/target/apache-storm-0.9.3.atdixon.tar.gz -C /opt && \
    mv /opt/apache-storm-0.9.3.atdixon /opt/apache-storm && \
    rm -rf /tmp/storm && rm -rf ~/.m2

WORKDIR /opt/apache-storm
ADD cluster.xml logback/cluster.xml
ADD configure.sh /
