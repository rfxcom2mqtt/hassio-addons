cd ..
cp build/Dockerfile rfxcom2mqtt-dev/
cp -R build/rootfs rfxcom2mqtt-dev/
docker run --rm --privileged \
-v $(pwd)/rfxcom2mqtt-dev:/data homeassistant/i386-builder --all -t /data \
--no-cache
#docker build ./rfxcom2mqtt-dev --build-arg="BUILD_VERSION=dev" -t rfxcom2mqtt/hassio-addon:dev

rm -rf rfxcom2mqtt-dev/rootfs
rm rfxcom2mqtt-dev/Dockerfile