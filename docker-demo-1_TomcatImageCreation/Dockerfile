# base image for the tomcat server, alpine provide a smaller image possible
FROM tomcat:7.0-alpine  

# environment variable for CATALINA_HOME
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Ensure CATALINA_HOME directory exists
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

# add your war package to tomcat folder
ADD ./target/*.war $CATALINA_HOME/webapps/

# you can override the port exposed
EXPOSE 8080
# can override the CMD, but this is default in the base image as well.
CMD ["catalina.sh", "run"]