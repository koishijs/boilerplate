FROM node:lts-alpine
RUN yarn create koishi koishi -y
RUN cd koishi && yarn install --prod && yarn add @koishijs/plugin-database-sqlite -W
RUN sed -i 's/host: .*/host: 0.0.0.0/g' /koishi/koishi.yml

FROM node:lts-alpine
COPY --from=0 /koishi /koishi

WORKDIR /koishi
ENTRYPOINT [ "yarn", "start" ]
