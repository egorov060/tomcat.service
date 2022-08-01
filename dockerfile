FROM ubuntu:20.04
RUN apt update
RUN apt install -y default-jdk
#RUN apt install -y tomcat9
RUN apt install -y git
RUN apt install -y maven
RUN apt install -y wget

RUN useradd -m -U -d /opt/tomcat -s /bin/false tomcat
#RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.23/bin/apache-tomcat-10.0.23.tar.gz -P /tmp
RUN cd /tmp
RUN git clone https://github.com/egorov060/docker.git

RUN tar -xf /tmp/docker/apache-tomcat-10.0.23.tar.gz -C /opt/
RUN cd docker && cp tomcat.service /etc/systemd/system/
RUN chown -R tomcat: /opt/apache-tomcat-10.0.23/
RUN sh -c 'chmod +x /opt/apache-tomcat-10.0.23/bin/*.sh'


RUN systemctl daemon-reload
RUN systemctl enable tomcat

RUN cd /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package && cd target && cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run", "java","bash"]
