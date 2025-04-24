# BFG tool by Roberto Tyley, https://rtyley.github.io/bfg-repo-cleaner/, licensed under GPLv3
# TODO: ^ Not sure this is proper attribution

# Using amazon corretto base image for its java runtime
FROM amazoncorretto:24.0.1-alpine3.20

# download BFG 
RUN mkdir /opt/bfg
RUN wget -O /opt/bfg/bfg.jar https://repo1.maven.org/maven2/com/madgag/bfg/1.15.0/bfg-1.15.0.jar

# set up bfg to be in path + executable
RUN echo 'java -jar /opt/bfg/bfg.jar' >> /usr/local/bin/bfg
RUN chmod -R 755 /usr/local/bin/bfg

# set up folder for git repo and set that as the default path when running the container
RUN mkdir /git-repo
WORKDIR /git-repo