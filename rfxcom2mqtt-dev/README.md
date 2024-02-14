# Home Assistant Add-on: Rfxcom2MQTT


[![Docker Pulls](https://img.shields.io/docker/pulls/rfxcom2mqtt/rfxcom2mqtt.svg?style=flat-square&logo=docker)](https://cloud.docker.com/u/dwelch2101/repository/docker/rfxcom2mqtt/rfxcom2mqtt)

⚠️ This is the Dev version (follows the Rfxcom2MQTT development branch) ⚠️

Allows you to use your Rfxcom devices with mqtt.

It bridges events and allows you to control your Rfxcom devices via MQTT. In this way you can integrate your Rfxcom devices with whatever smart home infrastructure you are using.

See Documentation tab for more details.

### Updating the Dev add-on
To update the `Dev` version of the add-on, you will need to uninstall and re-install the add-on.

⚠️ Make sure to backup your config as the procedure will not save this for you.

**Steps**
1. Backup config from: **Settings → Add-ons → Rfxcom2MQTT Dev → Configuration → ⋮ → Edit in YAML**, copy the **Options** somewhere safe
1. Uninstall: **Settings → Add-ons → Rfxcom2MQTT Dev → Uninstall**
1. Refresh repo: **Settings → Add-ons → Add-ons store → ⋮ → Check for updates**
1. Install: **Settings → Add-ons → Add-ons store → Rfxcom2MQTT Dev → Install**
1. Restore config to: **Settings → Add-ons → Rfxcom2MQTT Dev → Configuration → ⋮ → Edit in YAML**, paste your config from step 1.