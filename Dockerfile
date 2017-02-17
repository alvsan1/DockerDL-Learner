#
# Oracle Java 8 Dockerfile
#
# https://github.com/dockerfile/java
# https://github.com/dockerfile/java/tree/master/oracle-java8
#

# Pull base image.
FROM ubuntu

# Install Java. 
#Se instalo software-properties-common para add-apt-repository
#Se instalo apt-utils para wget

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get update && \
  apt-get -y install software-properties-common && \
  apt-get -y install apt-utils && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y wget && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  wget https://github.com/AKSW/DL-Learner/releases/download/1.3.0/dllearner-1.3.0.tar.gz  && \
  tar xvf dllearner-1.3.0.tar.gz && \
  cd dllearner-1.3.0 && \
  bin/cli examples/father.conf
  



# Define working directory.

WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]
