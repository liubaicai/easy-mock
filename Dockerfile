FROM node:8

# add user group, user and make user home dir
RUN mkdir -p /app/easy-mock

# set pwd to easy-mock home dir
WORKDIR /app/easy-mock

COPY . .

RUN npm install && npm run build