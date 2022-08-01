FROM ubuntu:20.04
RUN apt update
RUN apt install -y default-jdk
#RUN apt install -y tomcat9
RUN apt install -y git
RUN apt install -y maven
RUN apt install -y wget
RUN useradd -m -U -d /opt/tomcat -s /bin/false tomcat
#RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.23/bin/apache-tomcat-10.0.23.tar.gz -P /tmp
RUN cd /tmp && git clone https://github.com/egorov060/docker.git
#RUN git clone https://github.com/egorov060/docker.git
RUN tar -xf /tmp/docker/apache-tomcat-10.0.23.tar.gz -C /opt/
RUN cd /tmp/docker && cp tomcat.service /etc/systemd/system/
RUN chown -R tomcat: /opt/apache-tomcat-10.0.23/
RUN sh -c 'chmod +x /opt/apache-tomcat-10.0.23/bin/*.sh'
ENV CATALINA_BASE:   /opt/apache-tomcat-10.0.23
ENV CATALINA_HOME:   /opt/apache-tomcat-10.0.23
ENV CATALINA_TMPDIR: /opt/apache-tomcat-10.0.23/temp
ENV JRE_HOME:        /usr
ENV CLASSPATH:       /opt/apache-tomcat-10.0.23t/bin/bootstrap.jar:/opt/apache-tomcat-10.0.23/bin/tomcat-juli.jar
RUN cd /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package && cd target && cp hello-1.0.war /opt/apache-tomcat-10.0.23/webapps
EXPOSE 8080
CMD ["/opt/apache-tomcat-10.0.23/bin/catalina.sh", "run", "java","bash"]

