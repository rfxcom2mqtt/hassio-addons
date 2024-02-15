# Home Assistant Add-on: Rfxcom2Mqtt Proxy

[![Version](https://ghcr-badge.deta.dev/rfxcom2mqtt/rfxcom2mqtt-proxy-amd64/latest_tag?trim=major&label=latest)](https://github.com/rfxcom2mqtt/hassio-addons/pkgs/container/rfxcom2mqtt-proxy-amd64)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Frfxcom2mqtt%2Fhassio-addons%2Fmaster%2Frfxcom2mqtt-proxy%2Fconfig.json)
![Arch](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Frfxcom2mqtt%2Fhassio-addons%2Fmaster%2Frfxcom2mqtt-proxy%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/rfxcom2mqtt/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=rfxcom2mqtt/hassio-addons&utm_campaign=Badge_Grade)
[![Builder](https://img.shields.io/github/actions/workflow/status/rfxcom2mqtt/hassio-addons/builder.yml?label=Builder)](https://github.com/rfxcom2mqtt/hassio-addons/actions/workflows/builder.yml)





⚠️ This addon does not contain Rfxcom2Mqtt ⚠️

This addon acts as a proxy to an external running Rfxcom2Mqtt instance. 
The sole purpose of this addon is to add a Rfxcom2Mqtt icon to the sidebar of Home Assistant which will open the frontend of an external running Rfxcom2Mqtt instance.

## Options

- `server` (required): this should be the local URL on which the Rfxcom2Mqtt frontend is running, e.g. `http://192.168.2.43:8890`. Make sure there is no trailing slash!
- `auth_token` (optional): only use when you have an `auth_token` set for the frontend in the Rfxcom2Mqtt configuration.