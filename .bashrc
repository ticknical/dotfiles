##############################
# general aliases
##############################

alias ll="ls -al"

##############################
# docker functions
##############################

# Mount VM shared folders
function __dockerMount()
{
    local readonly folders=('eclipse' 'git')
    local          folder

    docker-machine ssh $1 sudo modprobe vboxsf

    for folder in "${folders[@]}"
    do
    if [[ $result -eq 0 ]]; then
        docker-machine ssh $1 sudo mkdir -p /storage/$folder

        if [[ $result -eq 0 ]]; then
            docker-machine ssh $1 sudo mount -t vboxsf $folder /storage/$folder
        fi
    fi
    done
}

# Build docker image
function dbu()
{
    docker build -t=$1 .;
}

# docker exec
function dex()
{
    docker exec -it $1 bash
}

# Using docker host switcher
function docker-use()
{
    eval "$(docker-machine env -u)"
    eval "$(docker-machine env $1)"
}
alias duse='docker-use'

# docker-dev start subcommand
function docker-dev::start()
{
    docker-machine start dev
    docker-use dev

    __dockerMount dev

    docker start nginx
}

# docker-dev stop subcommand
function docker-dev::stop()
{
    docker-machine stop dev
}

# docker-dev ssh subcommand
function docker-dev::ssh()
{
    docker-machine ssh dev
}

# Validate docker-dev subcommand impremented
function docker-dev::isSubcommand()
{
    local readonly IMPREMENTED_SUBCOMMAND=('start' 'stop' 'ssh')

    for subcommand in "${IMPREMENTED_SUBCOMMAND[@]}"
    do
        if [[ $subcommand = $1 ]]; then
            return 0
        fi
    done

    return 1
}

# Docker dev environment command
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
alias ddev='docker-dev'

##############################
# vagrant functions
##############################

# Validate vagrant-box subcommand impremented
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

# Validate vagrant-box box exist
function vagrant-box::isBoxExist()
{
    if [[ -e ${1}${2} ]]; then
        return 0
    fi

    return 1
}

# Vagrant box wrapper command
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
alias vbox='vagrant-box'
