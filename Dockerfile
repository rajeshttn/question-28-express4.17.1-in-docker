FROM mhart/alpine-node:10

# Pre Build Commands
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/node/express/pre-build-v2-alpine.sh
RUN chmod 775 ./pre-build-v2-alpine.sh
RUN sh pre-build-v2-alpine.sh

ENV MONGOMS_SYSTEM_BINARY=/usr/bin/mongod

COPY . /tmp/
WORKDIR /tmp/

EXPOSE 8080

# Build the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/node/express/build.sh
RUN chmod 775 ./build.sh
RUN sh build.sh

# Add extra docker commands here (if any)...

# Run the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/node/express/run.sh
RUN chmod 775 ./run.sh
CMD sh run.sh
