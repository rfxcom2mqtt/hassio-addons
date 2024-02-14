cd ..
cp build/Dockerfile rfxcom2mqtt-dev/
cp -R build/rootfs rfxcom2mqtt-dev/
docker run --rm --privileged \
-v $(pwd)/rfxcom2mqtt-dev:/data homeassistant/amd64-builder --amd64 -t /data \
--no-cache
rm -rf rfxcom2mqtt-dev/rootfs
rm rfxcom2mqtt-dev/Dockerfile