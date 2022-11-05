FROM node:lts-alpine

RUN yarn create koishi koishi -y && \
    cd koishi && yarn install --prod && \
    sed -i 's/host: .*/host: 0.0.0.0/g' /koishi/koishi.yml


FROM node:lts-alpine

COPY --from=0 /koishi /koishi

WORKDIR /koishi

ENTRYPOINT [ "yarn", "start" ]
