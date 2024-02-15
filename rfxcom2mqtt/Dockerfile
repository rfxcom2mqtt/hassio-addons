
#################
# 1 Build Image #
#################

ARG BUILD_FROM
FROM $BUILD_FROM as base

ENV LANG C.UTF-8
ARG BUILD_VERSION

################################
# 2 Install apps dependencies  #
################################

RUN apk add --no-cache socat tini nodejs

# Dependencies and build
FROM base as dependencies_and_build

RUN apk add --no-cache --virtual .buildtools npm make gcc g++ linux-headers udev git python3 && \
    echo "Installing Stable version ${BUILD_VERSION%-*}" && \
    curl -sL -o "/app.tar.gz" \
    "https://github.com/rfxcom2mqtt/backend/archive/${BUILD_VERSION%-*}.tar.gz" && \
    tar xzvf "/app.tar.gz"  && rm "/app.tar.gz" && \
    mv -v "backend-${BUILD_VERSION%-*}" app && \
    mkdir /app/dist && \
    jq -n --arg commit ${BUILD_VERSION%-*} '$commit' > /app/dist/.hash ; \
    echo "Installed Rfxcom2mqtt @ version $(cat /app/dist/.hash)" && \
    cd /app && \
    npm ci --no-audit --no-optional --no-update-notifier --unsafe-perm && \
    npm run build && \
    rm -rf node_modules && \
    npm ci --no-audit --no-optional --no-update-notifier --production --unsafe-perm && \
    # Serialport needs to be rebuild for Alpine https://serialport.io/docs/9.x.x/guide-installation#alpine-linux
    npm rebuild --build-from-source && \
    apk del .buildtools

####################
# 3 Install apps   #
####################

FROM base as release

WORKDIR /app

COPY --from=dependencies_and_build /app/node_modules ./node_modules
COPY --from=dependencies_and_build /app/dist ./dist
COPY --from=dependencies_and_build /app/package.json /app/LICENSE /app/index.js ./

ENV NODE_ENV production

################
# 4 Entrypoint #
################

# Add entrypoint
ADD "https://raw.githubusercontent.com/rfxcom2mqtt/hassio-addons/master/build/docker-entrypoint.sh" "/docker-entrypoint.sh"
RUN chmod 777 /docker-entrypoint.sh
ENTRYPOINT [ "/sbin/tini", "--", "/docker-entrypoint.sh"]

############
# 5 Labels #
############

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="rfxcom2mqtt (https://github.com/rfxcom2mqtt)" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Add-ons" \
    org.opencontainers.image.authors="rfxcom2mqtt (https://github.com/rfxcom2mqtt)" \
    org.opencontainers.image.licenses="Apache 2.0" \
    org.opencontainers.image.url="https://github.com/rfxcom2mqtt" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}