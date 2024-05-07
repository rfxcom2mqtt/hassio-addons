cd ..
docker run --rm --privileged \
-v $(pwd)/rfxcom2mqtt-dev:/data homeassistant/i386-builder --all -t /data \
--no-cache
#docker build ./rfxcom2mqtt-dev --build-arg="BUILD_VERSION=dev" -t rfxcom2mqtt/hassio-addon:dev