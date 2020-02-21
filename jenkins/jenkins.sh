function configure(){
    set -o allexport
    . ../etc/configuracion.conf
    set +o allexport
}

function install(){
    configure
    mkdir -p ${VAR_HOME}/jenkins
    chmod 777 ${VAR_HOME}/jenkins
    docker-compose up --no-start
    echo Ejecutar: 
    echo  docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
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
    sudo rm -r -f ${VAR_HOME}/jenkins
}

uninstall