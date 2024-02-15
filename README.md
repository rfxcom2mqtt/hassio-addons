<div align="center">
    <a href="https://github.com/rfxcom2mqtt/hassio-addons">
        Rfxcom2mqtt
    </a>
    <br>
    <br>
    <div style="display: flex;">
        <a href="https://github.com/rfxcom2mqtt/hassio-addons/actions?query=workflow%3ABuilder">
            <img src="https://github.com/rfxcom2mqtt/hassio-addons/workflows/Builder/badge.svg">
        </a>
        <a href="https://github.com/rfxcom2mqtt/hassio-addons/releases">
            <img src="https://img.shields.io/github/release/rfxcom2mqtt/hassio-addons.svg">
        </a>
        <a href="https://github.com/rfxcom2mqtt/hassio-addons/stargazers">
            <img src="https://img.shields.io/github/stars/rfxcom2mqtt/hassio-addons.svg">
        </a>
    </div>
    <h1>Official Rfxcom2mqtt Home Assistant addon</h1>
</div>

## Installation
1. If you don't have an MQTT broker yet; in Home Assistant go to **[Settings → Add-ons → Add-on store](https://my.home-assistant.io/redirect/supervisor_store/)** and install the **[Mosquitto broker](https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mosquitto)** addon, then start it.
1. Go back to the **Add-on store**, click **⋮ → Repositories**, fill in</br>  `https://github.com/rfxcom2mqtt/hassio-addons` and click **Add → Close** or click the **Add repository** button below, click **Add → Close** (You might need to enter the **internal IP address** of your Home Assistant instance first).  
[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%rfxcom2mqtt%2Fhassio-addons)
3. The repository includes add-ons:
    - **Rfxcom2mqtt** is the stable release that tracks the released versions of Rfxcom2mqtt.
4. Click on the addon and press **Install** and wait till the addon is installed.
5. Click on **Configuration**
    - If you are **not** using the Mosquitto broker addon fill in your MQTT details (leave empty when using the Mosquitto broker addon). Format can be found [here](https://rfxcom2mqtt.github.io/documentation/configuration/), but skip the initial `mqtt:` indent. e.g.: <br>
        ```yaml
        server: mqtt://localhost:1883
        username: my_user
        password: "my_password"
        ```
        Note: If the `password` includes certain special characters (reserved by yaml specification), the enclosing quotes are required. So it is recommended to always quote it when in doubt.
    - Fill in the serial details (e.g. port of your USB coordinator). Format can be found [here](https://rfxcom2mqtt.github.io/documentation/configuration/), but skip the initial `rfxcom:` indent. e.g.: <br>
        ```yaml
        usb_port: /dev/ttyUSB0
        ```
    - If you don't know the port and you have just one USB device connected to your machine try `/dev/ttyUSB0`. Else use the [Home Assistant CLI](https://www.home-assistant.io/common-tasks/os#home-assistant-via-the-command-line) and execute `ha hardware info` to find out. 
    - Click **Save**
1. Start the addon by going to **Info** and click **Start**
1. Wait till Rfxcom2mqtt starts and press **OPEN WEB UI** to verify Rfxcom2mqtt started correctly.
    - If it shows `502: Bad Gateway` wait a bit more and refresh the page.
    - If this takes too long (e.g. 2 minutes +) check the **Log** tab to see what went wrong.

For more information see [the documentation](https://rfxcom2mqtt.github.io/documentation/).

## Changelog
The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

All notable changes to this project will be documented in the [CHANGELOG.md](rfxcom2mqtt/CHANGELOG.md) file.

Version for releases is based on [Rfxcom2mqtt](https://github.com/rfxcom2mqtt/backend) format: `X.Y.Z`.

Any changes on the addon that do not require a new version of Rfxcom2mqtt will use the format: `X.Y.Z-A` where `X.Y.Z` is fixed on the Rfxcom2mqtt release version and `A` is related to the addon.


# DEV

```
npm install -g @devcontainers/cli

devcontainer up --workspace-folder ./

devcontainer exec --workspace-folder ./ supervisor_run
```
