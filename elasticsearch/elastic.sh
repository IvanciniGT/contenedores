function configure(){
    set -o allexport
    . ../etc/configuracion.conf
    set +o allexport
}

function install(){
    configure
    mkdir -p ${VAR_HOME}/elastic1
    chmod 777 ${VAR_HOME}/elastic1
    mkdir -p ${VAR_HOME}/elastic2
    chmod 777 ${VAR_HOME}/elastic2
    mkdir -p ${VAR_HOME}/elastic3
    chmod 777 ${VAR_HOME}/elastic3
    mkdir -p ${LOG_HOME}/nginx
    chmod 777 ${LOG_HOME}/nginx
    docker-compose up --no-start
}
function start(){
    configure
    sudo sysctl -w vm.max_map_count=262144
    docker-compose up -d
}
function stop(){
    configure
    docker-compose stop
}

function uninstall(){
    configure
    docker-compose rm -f
    sudo rm -r -f ${VAR_HOME}/elastic1
    sudo rm -r -f ${VAR_HOME}/elastic2
    sudo rm -r -f ${VAR_HOME}/elastic3
    sudo rm -r -f ${LOG_HOME}/nginx
}

start