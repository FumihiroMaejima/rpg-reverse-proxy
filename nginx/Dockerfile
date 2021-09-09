FROM nginx:1.19-alpine

RUN apk update && \
    apk add --update --no-cache --virtual=.build-dependencies && \
    apk add --update \
    nodejs \
    npm && \
    npm install -g yarn && \
    yarn global add @vue/cli
    #  && \
    # yarn install && \
    # yarn build

CMD ["nginx", "-g", "daemon off;","-c","/etc/nginx/nginx.conf"]
