FROM ubuntu:20.04
RUN apt update
RUN apt install -y default-jdk
RUN apt install -y tomcat9
RUN apt install -y git
RUN apt install -y maven
RUN cd /root
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package && cd target && cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run", "java","bash"]
