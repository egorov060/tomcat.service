FROM openjdk:11
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Main.java
CMD ["java", "Main"]
RUN -it --rm -p 8888:8080 tomcat:latest
CMD ["catalina.sh", "run"]