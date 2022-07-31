FROM openjdk:11
FROM tomcat:9.0
FROM ubuntu:20.04
ENV TZ=Europe/Kaliningrad
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
CMD ["catalina.sh", "run", "java", "bash"]
RUN apt update
RUN apt install -y git
RUN apt install -y maven
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /boxfuse-sample-java-war-hello
RUN mvn package
RUN cd /target
RUN cp hello-1.0.war /var/lib/tomcat9/webapps