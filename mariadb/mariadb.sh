function configure(){
    set -o allexport
    . ../etc/configuracion.conf
    set +o allexport
}

function install(){
    configure
    mkdir -p ${VAR_HOME}/mariadb
    chmod 777 ${VAR_HOME}/mariadb
    docker-compose up --no-start
}
function start(){
    configure
    docker-compose up -d
}
function stop(){
    configure
    docker-compose stop
}

function uninstall(){
    configure
    docker-compose rm -f
    sudo rm -r -f ${VAR_HOME}/mariadb
}

uninstall