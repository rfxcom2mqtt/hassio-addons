#!/usr/bin/env bashio

bashio::log.info "Preparing to start..."

# Check if HA supervisor started
# Workaround for:
# - https://github.com/home-assistant/supervisor/issues/3884

# Socat
if bashio::config.true 'socat.enabled'; then
    bashio::log.info "Socat enabled"
    SOCAT_MASTER=$(bashio::config 'socat.master')
    SOCAT_SLAVE=$(bashio::config 'socat.slave')

    # Validate input
    if [[ -z "$SOCAT_MASTER" ]]; then
    bashio::exit.nok "Socat is enabled but not started because no master address specified"
    fi
    if [[ -z "$SOCAT_SLAVE" ]]; then
    bashio::exit.nok "Socat is enabled but not started because no slave address specified"
    fi
    bashio::log.info "Starting socat"

    DATA_PATH="./"
    SOCAT_OPTIONS=$(bashio::config 'socat.options')

    # Socat start configuration
    bashio::log.blue "Socat startup parameters:"
    bashio::log.blue "Options:     $SOCAT_OPTIONS"
    bashio::log.blue "Master:      $SOCAT_MASTER"
    bashio::log.blue "Slave:       $SOCAT_SLAVE"

    bashio::log.info "Starting socat process ..."
    exec socat $SOCAT_OPTIONS $SOCAT_MASTER $SOCAT_SLAVE &

    bashio::log.debug "Modifying process for logging if required"
    if bashio::config.true 'socat.log'; then
        bashio::log.debug "Socat loggin enabled, setting file path to $DATA_PATH/socat.log"
        exec &>"$DATA_PATH/socat.log" 2>&1
    else
    bashio::log.debug "No logging required"
    fi
else
    bashio::log.info "Socat not enabled"
fi

export RFXCOM2MQTT_DATA="./"
if ! bashio::fs.file_exists "$RFXCOM2MQTT_DATA/config.yaml"; then
    mkdir -p "$RFXCOM2MQTT_DATA" || bashio::exit.nok "Could not create $RFXCOM2MQTT_DATA"
    bashio::log.info "create config file..."
    cat <<EOF > "$RFXCOM2MQTT_DATA/config.yaml"
homeassistant:
  discovery: true
frontend:
  enabled: true
  port: 8890
EOF
fi

export NODE_PATH=/app/node_modules

# Expose addon configuration through environment variables.
function export_config() {
    local key=${1}
    local subkey

    if bashio::config.is_empty "${key}"; then
        return
    fi

    for subkey in $(bashio::jq "$(bashio::config "${key}")" 'keys[]'); do
        local envKey=$(bashio::string.upper "${key}")_$(bashio::string.upper "${subkey}")
        bashio::log.info "export variable env ${envKey}"
        export "${envKey}=$(bashio::config "${key}.${subkey}")"
    done
}
export_config 'mqtt'
export_config 'rfxcom'
export FRONTEND_ENABLED="true"
export FRONTEND_PORT=8890
#export API_PUBLIC_URL=$(bashio::config 'public_url')
bashio::log.info "export variable env FRONTEND_ENABLED FRONTEND_PORT"

if bashio::config.is_empty 'mqtt' && bashio::var.has_value "$(bashio::services 'mqtt')"; then
    if bashio::var.true "$(bashio::services 'mqtt' 'ssl')"; then
        export MQTT_SERVER="mqtts://$(bashio::services 'mqtt' 'host'):$(bashio::services 'mqtt' 'port')"
    else
        export MQTT_SERVER="mqtt://$(bashio::services 'mqtt' 'host'):$(bashio::services 'mqtt' 'port')"
    fi
    bashio::log.info "export variable env MQTT_SERVER"
    bashio::log.info "export variable env MQTT_PASSWORD"
    bashio::log.info "export variable env MQTT_USERNAME"
    export MQTT_USERNAME="$(bashio::services 'mqtt' 'username')"
    export MQTT_PASSWORD="$(bashio::services 'mqtt' 'password')"
fi

bashio::log.info "Starting Rfxcom2MQTT..."
cd /app
exec node index.js