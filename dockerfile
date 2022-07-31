FROM ubuntu:20.04
RUN apt update
RUN apt install -y default-jdk
RUN apt install -y tomcat9
RUN apt install -y git
RUN apt install -y maven
#ENV TZ=Europe/Kaliningrad
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


#COPY mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
#COPY settings-docker.xml /usr/share/maven/ref/

#ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]

CMD ["bash"]
#RUN apt update
#RUN apt install -y git
#RUN apt install -y maven
#WORKDIR /root
RUN cd /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
#RUN cp -r boxfuse-sample-java-war-hello/. /root
RUN cd boxfuse-sample-java-war-hello && mvn package && cd target && cp hello-1.0.war /var/lib/tomcat9/webapps/

#RUN cd target
#RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
#RUN mv /root/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
#RUN cd target && cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080