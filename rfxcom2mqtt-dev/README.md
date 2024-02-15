# Home Assistant Add-on: Rfxcom2MQTT Dev

[![Version](https://ghcr-badge.deta.dev/rfxcom2mqtt/rfxcom2mqtt-dev-amd64/latest_tag?trim=major&label=latest)](https://github.com/rfxcom2mqtt/hassio-addons/pkgs/container/rfxcom2mqtt-dev-amd64)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Frfxcom2mqtt%2Fhassio-addons%2Fmaster%2Frfxcom2mqtt-dev%2Fconfig.json)
![Arch](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Frfxcom2mqtt%2Fhassio-addons%2Fmaster%2Frfxcom2mqtt-dev%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/rfxcom2mqtt/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=rfxcom2mqtt/hassio-addons&utm_campaign=Badge_Grade)
[![Builder](https://img.shields.io/github/actions/workflow/status/rfxcom2mqtt/hassio-addons/builder.yml?label=Builder)](https://github.com/rfxcom2mqtt/hassio-addons/actions/workflows/builder.yml)

⚠️ This is the Dev version (follows the Rfxcom2MQTT development branch) ⚠️

Allows you to use your Rfxcom devices with mqtt.

It bridges events and allows you to control your Rfxcom devices via MQTT. In this way you can integrate your Rfxcom devices with whatever smart home infrastructure you are using.

See Documentation tab for more details.

[Rfxcom2MQTT documentation](https://rfxcom2mqtt.github.io/documentation/)

### Updating the Dev add-on
To update the `Dev` version of the add-on, you will need to uninstall and re-install the add-on.

⚠️ Make sure to backup your config as the procedure will not save this for you.

**Steps**
1. Backup config from: **Settings → Add-ons → Rfxcom2MQTT Dev → Configuration → ⋮ → Edit in YAML**, copy the **Options** somewhere safe
1. Uninstall: **Settings → Add-ons → Rfxcom2MQTT Dev → Uninstall**
1. Refresh repo: **Settings → Add-ons → Add-ons store → ⋮ → Check for updates**
1. Install: **Settings → Add-ons → Add-ons store → Rfxcom2MQTT Dev → Install**
1. Restore config to: **Settings → Add-ons → Rfxcom2MQTT Dev → Configuration → ⋮ → Edit in YAML**, paste your config from step 1.
