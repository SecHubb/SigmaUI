FROM openjdk:8-jdk-slim
LABEL maintainer="John Hubbard, @SecHubb"


RUN apt -y update && apt -y install git wget

WORKDIR /root
RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-oss-6.3.0-amd64.deb
RUN dpkg -i /root/kibana-oss-6.3.0-amd64.deb
RUN git clone https://github.com/socprime/SigmaUI.git
RUN /usr/share/kibana/bin/kibana-plugin install file:///root/SigmaUI/sigma_ui_0.7.3.zip


CMD /usr/share/kibana/bin/kibana --elasticsearch.url="http://elasticsearch:9200" --kibana.defaultAppId=socprime_sigma_ui --server.host="0.0.0.0"