FROM ubuntu:latest

ARG APP_PORT
ENV APP_PORT=$APP_PORT

RUN echo "Installing curl...."
RUN apt-get update
RUN apt-get -y install curl

RUN  echo "Installing nodejs..."
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

WORKDIR /usr/src/app

COPY package*.json ./ . ./

RUN npm install


EXPOSE $APP_PORT

CMD ["node", "app.js"]