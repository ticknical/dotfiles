##############################
# backup functions
##############################

# backup develop workspace
function dev-backup()
{
    local date=`date "+%Y%m%d%H%M%S"`
    (cd ~/dev; tar cjf  ~/Dropbox/.dotfiles/dev/${date}.tar.bz2 --exclude='.DS_Store' *;)
}

# backup firefox profile
function firefox-backup()
{
    local date=`date "+%Y%m%d%H%M%S"`
    (cd ~/Library/Application\ Support/Firefox; tar cjf  ~/Dropbox/.dotfiles/firefox/${date}.tar.bz2 --exclude='.DS_Store' Profiles profiles.ini;)
}

# backup thunderbird profile
function thunderbird-backup()
{
    local date=`date "+%Y%m%d%H%M%S"`
    (cd ~/Library/Thunderbird; tar cjf  ~/Dropbox/.dotfiles/thunderbird/${date}.tar.bz2 --exclude='.DS_Store' Profiles profiles.ini;)
}

##############################
# docker functions
##############################

# initialize docker environment
function __dockerInit()
{
    # create cgroups directory
    docker-machine ssh $1 '
        sudo mkdir /sys/fs/cgroup/systemd;
        sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd;
    ';
}

# build docker image
function dbu()
{
    docker build -t=$1 .;
}

# docker exec
function dex()
{
    docker exec -it $1 bash
}

# using docker host switcher
function docker-use()
{
    eval "$(docker-machine env -u)"
    eval "$(docker-machine env $1)"
}

# docker-dev start subcommand
function docker-dev::start()
{
    docker-machine start dev
    docker-use dev

    __dockerInit dev

    docker start proxy
}

# docker-dev stop subcommand
function docker-dev::stop()
{
    docker-machine stop dev
}

# docker-dev restart subcommand
function docker-dev::restart()
{
    docker-dev::stop
    docker-dev::start
}

# docker-dev ssh subcommand
function docker-dev::ssh()
{
    docker-machine ssh dev
}

# validate docker-dev subcommand impremented
function docker-dev::isSubcommand()
{
    local readonly IMPREMENTED_SUBCOMMAND=('start' 'stop' 'restart' 'ssh')

    for subcommand in "${IMPREMENTED_SUBCOMMAND[@]}"
    do
        if [[ $subcommand = $1 ]]; then
            return 0
        fi
    done

    return 1
}

# docker dev environment command
function docker-dev()
{
    docker-dev::isSubcommand $1

    if [[ $? -ne 0 ]]; then
        echo "docker-dev ${1} is not impremented..."
        return 1
    fi

    docker-dev::$1
    return 0
}

##############################
# vagrant functions
##############################

# validate vagrant-box subcommand impremented
function vagrant-box::isSubcommand()
{
    local readonly ALLOW_VAGRANT_SUBCOMMAND=('up' 'halt' 'destroy')

    for subcommand in "${ALLOW_VAGRANT_SUBCOMMAND[@]}"
    do
        if [[ $subcommand = $1 ]]; then
            return 0
        fi
    done

    return 1
}

# validate vagrant-box box exist
function vagrant-box::isBoxExist()
{
    if [[ -e ${1}${2} ]]; then
        return 0
    fi

    return 1
}

# vagrant box wrapper command
function vagrant-box()
{
    local readonly BEFORE_PWD=${PWD}
    local readonly VAGRANT_PATH='/usr/local/bin/vagrant'
    local readonly VAGRANT_BOXES='/devel/env/vagrant/'

    vagrant-box::isSubcommand $1

    if [[ $? -ne 0 ]]; then
        echo "vagrant ${1} is an exception of the wrapper command..."
        return 1
    fi

    vagrant-box::isBoxExist ${VAGRANT_BOXES} $2

    if [[ $? -ne 0 ]]; then
        echo 'not exist vagrant box...'
        return 1
    fi

    cd ${VAGRANT_BOXES}${2}
    ${VAGRANT_PATH} ${1}

    cd ${BEFORE_PWD}
    return 0
}

